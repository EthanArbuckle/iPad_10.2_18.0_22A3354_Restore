@implementation BMSafariBrowsingAssistantServerRequestContext

- (BMSafariBrowsingAssistantServerRequestContext)initWithWebpageViewIdentifier:(id)a3 requestIdentifier:(id)a4 started:(id)a5 ended:(id)a6 failed:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  BMSafariBrowsingAssistantServerRequestContext *v17;
  id v19;
  objc_super v20;

  v19 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)BMSafariBrowsingAssistantServerRequestContext;
  v17 = -[BMEventBase init](&v20, sel_init);
  if (v17)
  {
    v17->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v17->_webpageViewIdentifier, a3);
    objc_storeStrong((id *)&v17->_requestIdentifier, a4);
    objc_storeStrong((id *)&v17->_started, a5);
    objc_storeStrong((id *)&v17->_ended, a6);
    objc_storeStrong((id *)&v17->_failed, a7);
  }

  return v17;
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
  -[BMSafariBrowsingAssistantServerRequestContext webpageViewIdentifier](self, "webpageViewIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariBrowsingAssistantServerRequestContext requestIdentifier](self, "requestIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariBrowsingAssistantServerRequestContext started](self, "started");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariBrowsingAssistantServerRequestContext ended](self, "ended");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariBrowsingAssistantServerRequestContext failed](self, "failed");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSafariBrowsingAssistantServerRequestContext with webpageViewIdentifier: %@, requestIdentifier: %@, started: %@, ended: %@, failed: %@"), v4, v5, v6, v7, v8);

  return (NSString *)v9;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSafariBrowsingAssistantServerRequestContext *v5;
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
  uint64_t v20;
  void *v21;
  objc_class *v22;
  uint64_t v23;
  void *v24;
  BMSafariBrowsingAssistantServerRequestContext *v25;
  objc_super v27;
  uint64_t v28;
  uint64_t v29;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)BMSafariBrowsingAssistantServerRequestContext;
  v5 = -[BMEventBase init](&v27, sel_init);
  if (!v5)
    goto LABEL_38;
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
          v20 = 24;
          goto LABEL_24;
        case 2u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 32;
LABEL_24:
          v21 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          break;
        case 3u:
          v28 = 0;
          v29 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_37;
          v22 = -[BMSafariBrowsingAssistantServerRequestContextStarted initByReadFrom:]([BMSafariBrowsingAssistantServerRequestContextStarted alloc], "initByReadFrom:", v4);
          if (!v22)
            goto LABEL_37;
          v23 = 40;
          goto LABEL_34;
        case 4u:
          v28 = 0;
          v29 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_37;
          v22 = -[BMSafariBrowsingAssistantServerRequestContextEnded initByReadFrom:]([BMSafariBrowsingAssistantServerRequestContextEnded alloc], "initByReadFrom:", v4);
          if (!v22)
            goto LABEL_37;
          v23 = 48;
          goto LABEL_34;
        case 5u:
          v28 = 0;
          v29 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_37;
          v22 = -[BMSafariBrowsingAssistantServerRequestContextFailed initByReadFrom:]([BMSafariBrowsingAssistantServerRequestContextFailed alloc], "initByReadFrom:", v4);
          if (!v22)
            goto LABEL_37;
          v23 = 56;
LABEL_34:
          v24 = *(Class *)((char *)&v5->super.super.isa + v23);
          *(Class *)((char *)&v5->super.super.isa + v23) = v22;

          PBReaderRecallMark();
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_37;
          break;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_37:
    v25 = 0;
  else
LABEL_38:
    v25 = v5;

  return v25;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_webpageViewIdentifier)
    PBDataWriterWriteDataField();
  if (self->_requestIdentifier)
    PBDataWriterWriteStringField();
  if (self->_started)
  {
    PBDataWriterPlaceMark();
    -[BMSafariBrowsingAssistantServerRequestContextStarted writeTo:](self->_started, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_ended)
  {
    PBDataWriterPlaceMark();
    -[BMSafariBrowsingAssistantServerRequestContextEnded writeTo:](self->_ended, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_failed)
  {
    PBDataWriterPlaceMark();
    -[BMSafariBrowsingAssistantServerRequestContextFailed writeTo:](self->_failed, "writeTo:", v4);
    PBDataWriterRecallMark();
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSafariBrowsingAssistantServerRequestContext writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSafariBrowsingAssistantServerRequestContext)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  BMSafariBrowsingAssistantServerRequestContext *v13;
  BMSafariBrowsingAssistantServerRequestContextEnded *v14;
  id v15;
  BMSafariBrowsingAssistantServerRequestContextFailed *v16;
  BMSafariBrowsingAssistantServerRequestContext *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  id v26;
  BMSafariBrowsingAssistantServerRequestContext *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;
  BMSafariBrowsingAssistantServerRequestContext *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id *v49;
  id v50;
  BMSafariBrowsingAssistantServerRequestContextStarted *v51;
  id v52;
  id v53;
  id v54;
  uint64_t v55;
  BMSafariBrowsingAssistantServerRequestContextFailed *v56;
  uint64_t v57;
  BMSafariBrowsingAssistantServerRequestContextEnded *v58;
  uint64_t v59;
  BMSafariBrowsingAssistantServerRequestContextStarted *v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  _QWORD v64[3];

  v64[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("webpageViewIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("requestIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = a4;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v20 = 0;
          v17 = 0;
          goto LABEL_53;
        }
        v26 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v27 = self;
        v28 = *MEMORY[0x1E0D025B8];
        v61 = *MEMORY[0x1E0CB2D50];
        v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("requestIdentifier"));
        v62 = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = v28;
        self = v27;
        v51 = (BMSafariBrowsingAssistantServerRequestContextStarted *)v29;
        v17 = 0;
        v20 = 0;
        *v49 = (id)objc_msgSend(v26, "initWithDomain:code:userInfo:", v30, 2);
        goto LABEL_51;
      }
      v10 = v9;
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("started"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v10;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v49)
        {
          v17 = 0;
          v20 = v10;
          goto LABEL_52;
        }
        v48 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v44 = *MEMORY[0x1E0D025B8];
        v59 = *MEMORY[0x1E0CB2D50];
        v33 = v8;
        v34 = self;
        v35 = objc_alloc(MEMORY[0x1E0CB3940]);
        v40 = objc_opt_class();
        v36 = v35;
        self = v34;
        v8 = v33;
        v51 = (BMSafariBrowsingAssistantServerRequestContextStarted *)objc_msgSend(v36, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), v40, CFSTR("started"));
        v60 = v51;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *v49 = (id)objc_msgSend(v48, "initWithDomain:code:userInfo:", v44, 2, v37);

        v17 = 0;
        v18 = v11;
        goto LABEL_50;
      }
      v18 = v11;
      v54 = 0;
      v51 = -[BMSafariBrowsingAssistantServerRequestContextStarted initWithJSONDictionary:error:]([BMSafariBrowsingAssistantServerRequestContextStarted alloc], "initWithJSONDictionary:error:", v18, &v54);
      v19 = v54;
      v20 = v50;
      if (v19)
      {
        v21 = v19;
        if (v49)
          *v49 = objc_retainAutorelease(v19);

        v17 = 0;
        goto LABEL_51;
      }

    }
    else
    {
      v51 = 0;
    }
    v47 = v8;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ended"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = self;
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v49)
        {
          v17 = 0;
          goto LABEL_49;
        }
        v45 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v41 = *MEMORY[0x1E0D025B8];
        v57 = *MEMORY[0x1E0CB2D50];
        v14 = (BMSafariBrowsingAssistantServerRequestContextEnded *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("ended"));
        v58 = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
        v15 = (id)objc_claimAutoreleasedReturnValue();
        v17 = 0;
        *v49 = (id)objc_msgSend(v45, "initWithDomain:code:userInfo:", v41, 2, v15);
LABEL_48:

LABEL_49:
        v18 = v11;
        self = v13;
        v8 = v47;
LABEL_50:
        v20 = v50;
LABEL_51:

        v11 = v18;
LABEL_52:

        goto LABEL_53;
      }
      v15 = v12;
      v53 = 0;
      v14 = -[BMSafariBrowsingAssistantServerRequestContextEnded initWithJSONDictionary:error:]([BMSafariBrowsingAssistantServerRequestContextEnded alloc], "initWithJSONDictionary:error:", v15, &v53);
      v22 = v53;
      if (v22)
      {
        v23 = v22;
        if (v49)
          *v49 = objc_retainAutorelease(v22);

        goto LABEL_55;
      }

    }
    else
    {
      v14 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("failed"));
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v16 = 0;
LABEL_16:
      v17 = -[BMSafariBrowsingAssistantServerRequestContext initWithWebpageViewIdentifier:requestIdentifier:started:ended:failed:](v13, "initWithWebpageViewIdentifier:requestIdentifier:started:ended:failed:", v47, v50, v51, v14, v16);
      v13 = v17;
LABEL_47:

      goto LABEL_48;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v52 = 0;
      v43 = v15;
      v16 = -[BMSafariBrowsingAssistantServerRequestContextFailed initWithJSONDictionary:error:]([BMSafariBrowsingAssistantServerRequestContextFailed alloc], "initWithJSONDictionary:error:", v43, &v52);
      v31 = v52;
      if (!v31)
      {

        goto LABEL_16;
      }
      v32 = v31;
      if (v49)
        *v49 = objc_retainAutorelease(v31);

LABEL_46:
      v17 = 0;
      goto LABEL_47;
    }
    if (v49)
    {
      v46 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v42 = *MEMORY[0x1E0D025B8];
      v55 = *MEMORY[0x1E0CB2D50];
      v16 = (BMSafariBrowsingAssistantServerRequestContextFailed *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("failed"));
      v56 = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *v49 = (id)objc_msgSend(v46, "initWithDomain:code:userInfo:", v42, 2, v38);

      goto LABEL_46;
    }
LABEL_55:
    v17 = 0;
    goto LABEL_48;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v17 = 0;
    v8 = 0;
    goto LABEL_54;
  }
  v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v25 = *MEMORY[0x1E0D025B8];
  v63 = *MEMORY[0x1E0CB2D50];
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSData"), objc_opt_class(), CFSTR("webpageViewIdentifier"));
  v64[0] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, &v63, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v8 = 0;
  *a4 = (id)objc_msgSend(v24, "initWithDomain:code:userInfo:", v25, 2, v9);
LABEL_53:

LABEL_54:
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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  _QWORD v26[6];

  v26[5] = *MEMORY[0x1E0C80C00];
  -[BMSafariBrowsingAssistantServerRequestContext webpageViewIdentifier](self, "webpageViewIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "base64EncodedStringWithOptions:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMSafariBrowsingAssistantServerRequestContext requestIdentifier](self, "requestIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariBrowsingAssistantServerRequestContext started](self, "started");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "jsonDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMSafariBrowsingAssistantServerRequestContext ended](self, "ended");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "jsonDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMSafariBrowsingAssistantServerRequestContext failed](self, "failed");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "jsonDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = CFSTR("webpageViewIdentifier");
  v12 = (uint64_t)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v19 = v12;
  v26[0] = v12;
  v22 = CFSTR("requestIdentifier");
  v13 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v12, v21, v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26[1] = v13;
  v23 = CFSTR("started");
  v14 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26[2] = v14;
  v24 = CFSTR("ended");
  v15 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26[3] = v15;
  v25 = CFSTR("failed");
  v16 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26[4] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v21, 5, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (v9)
      goto LABEL_13;
  }
  else
  {

    if (v9)
    {
LABEL_13:
      if (v7)
        goto LABEL_14;
      goto LABEL_19;
    }
  }

  if (v7)
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

  return v17;
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSafariBrowsingAssistantServerRequestContext webpageViewIdentifier](self, "webpageViewIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "webpageViewIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSafariBrowsingAssistantServerRequestContext webpageViewIdentifier](self, "webpageViewIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "webpageViewIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_17;
    }
    -[BMSafariBrowsingAssistantServerRequestContext requestIdentifier](self, "requestIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestIdentifier");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMSafariBrowsingAssistantServerRequestContext requestIdentifier](self, "requestIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "requestIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_17;
    }
    -[BMSafariBrowsingAssistantServerRequestContext started](self, "started");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "started");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMSafariBrowsingAssistantServerRequestContext started](self, "started");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "started");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_17;
    }
    -[BMSafariBrowsingAssistantServerRequestContext ended](self, "ended");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ended");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMSafariBrowsingAssistantServerRequestContext ended](self, "ended");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "ended");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
      {
LABEL_17:
        v12 = 0;
LABEL_23:

        goto LABEL_24;
      }
    }
    -[BMSafariBrowsingAssistantServerRequestContext failed](self, "failed");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "failed");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31 == v32)
    {
      v12 = 1;
    }
    else
    {
      -[BMSafariBrowsingAssistantServerRequestContext failed](self, "failed");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "failed");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v33, "isEqual:", v34);

    }
    goto LABEL_23;
  }
  v12 = 0;
LABEL_24:

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

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (BMSafariBrowsingAssistantServerRequestContextStarted)started
{
  return self->_started;
}

- (BMSafariBrowsingAssistantServerRequestContextEnded)ended
{
  return self->_ended;
}

- (BMSafariBrowsingAssistantServerRequestContextFailed)failed
{
  return self->_failed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failed, 0);
  objc_storeStrong((id *)&self->_ended, 0);
  objc_storeStrong((id *)&self->_started, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
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

    v4 = -[BMSafariBrowsingAssistantServerRequestContext initByReadFrom:]([BMSafariBrowsingAssistantServerRequestContext alloc], "initByReadFrom:", v7);
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
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("webpageViewIdentifier"), 4, 0, 1, 14, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("requestIdentifier"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("started_json"), 5, 1, &__block_literal_global_551);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("ended_json"), 5, 1, &__block_literal_global_552);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("failed_json"), 5, 1, &__block_literal_global_553);
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
  return &unk_1E5F1D350;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("webpageViewIdentifier"), 1, 14, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("requestIdentifier"), 2, 13, 0, v2);
  v9[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("started"), 3, 14, objc_opt_class());
  v9[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("ended"), 4, 14, objc_opt_class());
  v9[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("failed"), 5, 14, objc_opt_class());
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __56__BMSafariBrowsingAssistantServerRequestContext_columns__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "failed");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __56__BMSafariBrowsingAssistantServerRequestContext_columns__block_invoke_2(uint64_t a1, void *a2)
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

id __56__BMSafariBrowsingAssistantServerRequestContext_columns__block_invoke(uint64_t a1, void *a2)
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

@end
