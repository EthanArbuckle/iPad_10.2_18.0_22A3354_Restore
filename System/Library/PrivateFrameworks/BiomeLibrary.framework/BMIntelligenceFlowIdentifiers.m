@implementation BMIntelligenceFlowIdentifiers

- (BMIntelligenceFlowIdentifiers)initWithSessionId:(id)a3 spanId:(id)a4 clientRequestId:(id)a5 clientSessionId:(id)a6 clientApplicationId:(id)a7 clientGroupIdentifier:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  BMIntelligenceFlowIdentifiers *v20;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = -[BMIntelligenceFlowIdentifiers initWithSessionId:spanId:clientRequestId:clientSessionId:clientApplicationId:clientGroupIdentifier:requestEventId:]([BMIntelligenceFlowIdentifiers alloc], "initWithSessionId:spanId:clientRequestId:clientSessionId:clientApplicationId:clientGroupIdentifier:requestEventId:", v19, v18, v17, v16, v15, v14, 0);

  return v20;
}

- (BMIntelligenceFlowIdentifiers)initWithSessionId:(id)a3 spanId:(id)a4 clientRequestId:(id)a5 clientSessionId:(id)a6 clientApplicationId:(id)a7 clientGroupIdentifier:(id)a8 requestEventId:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  BMIntelligenceFlowIdentifiers *v19;
  uint64_t v20;
  NSData *raw_sessionId;
  uint64_t v22;
  uint64_t v23;
  NSData *raw_requestEventId;
  id v26;
  id v27;
  id v28;
  objc_super v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v28 = a4;
  v27 = a5;
  v26 = a6;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  v29.receiver = self;
  v29.super_class = (Class)BMIntelligenceFlowIdentifiers;
  v19 = -[BMEventBase init](&v29, sel_init);
  if (v19)
  {
    v19->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion", v26, v27);
    if (v15)
    {
      v30 = 0;
      v31 = 0;
      objc_msgSend(v15, "getUUIDBytes:", &v30);
      v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v30, 16);
      raw_sessionId = v19->_raw_sessionId;
      v19->_raw_sessionId = (NSData *)v20;
    }
    else
    {
      v15 = 0;
      raw_sessionId = v19->_raw_sessionId;
      v19->_raw_sessionId = 0;
    }

    v22 = (uint64_t)v28;
    if (v28)
    {
      v19->_hasSpanId = 1;
      v22 = objc_msgSend(v28, "unsignedLongLongValue");
    }
    else
    {
      v19->_hasSpanId = 0;
    }
    v19->_spanId = v22;
    objc_storeStrong((id *)&v19->_clientRequestId, a5);
    objc_storeStrong((id *)&v19->_clientSessionId, a6);
    objc_storeStrong((id *)&v19->_clientApplicationId, a7);
    objc_storeStrong((id *)&v19->_clientGroupIdentifier, a8);
    if (v18)
    {
      v30 = 0;
      v31 = 0;
      objc_msgSend(v18, "getUUIDBytes:", &v30);
      v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v30, 16);
      raw_requestEventId = v19->_raw_requestEventId;
      v19->_raw_requestEventId = (NSData *)v23;
    }
    else
    {
      raw_requestEventId = v19->_raw_requestEventId;
      v19->_raw_requestEventId = 0;
    }

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

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMIntelligenceFlowIdentifiers sessionId](self, "sessionId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[BMIntelligenceFlowIdentifiers spanId](self, "spanId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligenceFlowIdentifiers clientRequestId](self, "clientRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligenceFlowIdentifiers clientSessionId](self, "clientSessionId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligenceFlowIdentifiers clientApplicationId](self, "clientApplicationId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligenceFlowIdentifiers clientGroupIdentifier](self, "clientGroupIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligenceFlowIdentifiers requestEventId](self, "requestEventId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMIntelligenceFlowIdentifiers with sessionId: %@, spanId: %@, clientRequestId: %@, clientSessionId: %@, clientApplicationId: %@, clientGroupIdentifier: %@, requestEventId: %@"), v4, v5, v6, v7, v8, v9, v10);

  return (NSString *)v11;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMIntelligenceFlowIdentifiers *v5;
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
  void *v19;
  uint64_t v20;
  char v21;
  unsigned int v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  BMIntelligenceFlowIdentifiers *v30;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)BMIntelligenceFlowIdentifiers;
  v5 = -[BMEventBase init](&v32, sel_init);
  if (!v5)
  {
LABEL_48:
    v30 = v5;
    goto LABEL_49;
  }
  v6 = (int *)MEMORY[0x1E0D82BF0];
  v7 = (int *)MEMORY[0x1E0D82BD8];
  v8 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] >= *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
LABEL_46:
    if (v4[*v8])
      goto LABEL_47;
    goto LABEL_48;
  }
  v9 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (v4[*v8])
      goto LABEL_46;
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
      goto LABEL_46;
    switch((v12 >> 3))
    {
      case 1u:
        PBReaderReadData();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "length") != 16)
          goto LABEL_50;
        v20 = 16;
        goto LABEL_38;
      case 2u:
        v21 = 0;
        v22 = 0;
        v23 = 0;
        v5->_hasSpanId = 1;
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
                v23 = 0;
                goto LABEL_45;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v8])
          v23 = 0;
LABEL_45:
        v5->_spanId = v23;
        goto LABEL_40;
      case 3u:
        PBReaderReadString();
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = 48;
        goto LABEL_35;
      case 4u:
        PBReaderReadString();
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = 56;
        goto LABEL_35;
      case 5u:
        PBReaderReadString();
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = 64;
        goto LABEL_35;
      case 6u:
        PBReaderReadString();
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = 72;
LABEL_35:
        v29 = *(Class *)((char *)&v5->super.super.isa + v28);
        *(Class *)((char *)&v5->super.super.isa + v28) = (Class)v27;
        goto LABEL_39;
      case 7u:
        PBReaderReadData();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "length") == 16)
        {
          v20 = 24;
LABEL_38:
          v29 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;
LABEL_39:

LABEL_40:
          if (*(_QWORD *)&v4[*v6] >= *(_QWORD *)&v4[*v7])
            goto LABEL_46;
          continue;
        }
LABEL_50:

LABEL_47:
        v30 = 0;
LABEL_49:

        return v30;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          goto LABEL_47;
        goto LABEL_40;
    }
  }
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_raw_sessionId)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_hasSpanId)
  {
    PBDataWriterWriteUint64Field();
    v4 = v5;
  }
  if (self->_clientRequestId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_clientSessionId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_clientApplicationId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_clientGroupIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_raw_requestEventId)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMIntelligenceFlowIdentifiers writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMIntelligenceFlowIdentifiers)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BMIntelligenceFlowIdentifiers *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  id v33;
  id v34;
  uint64_t v35;
  id *v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  id *v46;
  id v47;
  uint64_t v48;
  void *v49;
  id v50;
  id *v51;
  void *v52;
  id v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id *v67;
  id *v68;
  id *v69;
  void *v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id *v75;
  void *v76;
  BMIntelligenceFlowIdentifiers *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  id v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  id *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  _QWORD v95[3];

  v95[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sessionId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("spanId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v21 = 0;
          v10 = 0;
          goto LABEL_32;
        }
        v31 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v32 = *MEMORY[0x1E0D025B8];
        v90 = *MEMORY[0x1E0CB2D50];
        v68 = a4;
        a4 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("spanId"));
        v91 = a4;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v91, &v90, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (id)objc_msgSend(v31, "initWithDomain:code:userInfo:", v32, 2, v23);
        v21 = 0;
        v10 = 0;
        *v68 = v33;
LABEL_31:

LABEL_32:
        goto LABEL_33;
      }
      v10 = v9;
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("clientRequestId"));
    v11 = objc_claimAutoreleasedReturnValue();
    v76 = (void *)v11;
    v77 = self;
    if (v11 && (v12 = (void *)v11, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v21 = 0;
          v23 = v76;
          goto LABEL_31;
        }
        v36 = a4;
        v37 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v38 = v10;
        v39 = *MEMORY[0x1E0D025B8];
        v88 = *MEMORY[0x1E0CB2D50];
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("clientRequestId"));
        v89 = v22;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v89, &v88, 1);
        v40 = objc_claimAutoreleasedReturnValue();
        v41 = v37;
        v13 = (void *)v40;
        v42 = v39;
        v10 = v38;
        v21 = 0;
        a4 = 0;
        *v36 = (id)objc_msgSend(v41, "initWithDomain:code:userInfo:", v42, 2, v40);
        goto LABEL_30;
      }
      v75 = v12;
    }
    else
    {
      v75 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("clientSessionId"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v10;
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v22 = 0;
          v21 = 0;
          goto LABEL_29;
        }
        v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v69 = a4;
        v44 = *MEMORY[0x1E0D025B8];
        v86 = *MEMORY[0x1E0CB2D50];
        v72 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("clientSessionId"));
        v87 = v72;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 0;
        v22 = 0;
        *v69 = (id)objc_msgSend(v43, "initWithDomain:code:userInfo:", v44, 2, v14);
LABEL_28:

        v10 = v74;
LABEL_29:
        a4 = v75;
LABEL_30:

        v23 = v76;
        self = v77;
        goto LABEL_31;
      }
      v71 = v13;
    }
    else
    {
      v71 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("clientApplicationId"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v72 = 0;
          v21 = 0;
          goto LABEL_27;
        }
        v73 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v45 = *MEMORY[0x1E0D025B8];
        v84 = *MEMORY[0x1E0CB2D50];
        v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("clientApplicationId"));
        v85 = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1);
        v46 = a4;
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = (id)objc_msgSend(v73, "initWithDomain:code:userInfo:", v45, 2, v15);
        v21 = 0;
        v72 = 0;
        *v46 = v47;
LABEL_26:

LABEL_27:
        v22 = v71;
        goto LABEL_28;
      }
      v67 = a4;
      v72 = v14;
    }
    else
    {
      v67 = a4;
      v72 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("clientGroupIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v13;
    if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v67)
        {
          v16 = 0;
          v21 = 0;
          goto LABEL_25;
        }
        v64 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v48 = *MEMORY[0x1E0D025B8];
        v82 = *MEMORY[0x1E0CB2D50];
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("clientGroupIdentifier"));
        v83 = v17;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *v67 = (id)objc_msgSend(v64, "initWithDomain:code:userInfo:", v48, 2, v49);

        v21 = 0;
        v16 = 0;
LABEL_24:

LABEL_25:
        v13 = v70;
        goto LABEL_26;
      }
      v16 = v15;
    }
    else
    {
      v16 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("requestEventId"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v67)
        {
          v65 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v62 = *MEMORY[0x1E0D025B8];
          v78 = *MEMORY[0x1E0CB2D50];
          v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("requestEventId"));
          v79 = v60;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          *v67 = (id)objc_msgSend(v65, "initWithDomain:code:userInfo:", v62, 2, v57);

        }
        v21 = 0;
        goto LABEL_24;
      }
      v18 = v9;
      v19 = v7;
      v34 = v17;
      v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v34);
      if (!v35)
      {
        if (v67)
        {
          v63 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v61 = *MEMORY[0x1E0D025B8];
          v80 = *MEMORY[0x1E0CB2D50];
          v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("-initWithUUIDString: for %@ returned nil"), CFSTR("requestEventId"));
          v81 = v58;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
          v66 = v34;
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          *v67 = (id)objc_msgSend(v63, "initWithDomain:code:userInfo:", v61, 2, v59);

          v34 = v66;
        }

        v17 = v34;
        v21 = 0;
        goto LABEL_23;
      }
      v20 = (void *)v35;

    }
    else
    {
      v18 = v9;
      v19 = v7;
      v20 = 0;
    }
    v21 = -[BMIntelligenceFlowIdentifiers initWithSessionId:spanId:clientRequestId:clientSessionId:clientApplicationId:clientGroupIdentifier:requestEventId:](v77, "initWithSessionId:spanId:clientRequestId:clientSessionId:clientApplicationId:clientGroupIdentifier:requestEventId:", v8, v74, v75, v71, v72, v16, v20);

    v77 = v21;
LABEL_23:
    v7 = v19;
    v9 = v18;
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a4)
    {
      v21 = 0;
      goto LABEL_35;
    }
    v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v28 = *MEMORY[0x1E0D025B8];
    v92 = *MEMORY[0x1E0CB2D50];
    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("sessionId"));
    v93 = v29;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v93, &v92, 1);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v30 = v28;
    v8 = (id)v29;
    v21 = 0;
    *a4 = (id)objc_msgSend(v27, "initWithDomain:code:userInfo:", v30, 2, v10);
    goto LABEL_33;
  }
  v8 = v7;
  v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v8);
  if (v25)
  {
    v26 = (void *)v25;

    v8 = v26;
    goto LABEL_4;
  }
  if (!a4)
  {
    v21 = 0;
    goto LABEL_34;
  }
  v50 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v51 = a4;
  v52 = v7;
  v53 = v8;
  v54 = *MEMORY[0x1E0D025B8];
  v94 = *MEMORY[0x1E0CB2D50];
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("-initWithUUIDString: for %@ returned nil"), CFSTR("sessionId"));
  v95[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v95, &v94, 1);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v54;
  v8 = v53;
  v7 = v52;
  *v51 = (id)objc_msgSend(v50, "initWithDomain:code:userInfo:", v56, 2, v55);

  v21 = 0;
LABEL_33:

LABEL_34:
LABEL_35:

  return v21;
}

- (id)jsonDictionary
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
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
  _QWORD v26[7];
  _QWORD v27[9];

  v27[7] = *MEMORY[0x1E0C80C00];
  -[BMIntelligenceFlowIdentifiers sessionId](self, "sessionId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = objc_claimAutoreleasedReturnValue();

  if (-[BMIntelligenceFlowIdentifiers hasSpanId](self, "hasSpanId"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[BMIntelligenceFlowIdentifiers spanId](self, "spanId"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[BMIntelligenceFlowIdentifiers clientRequestId](self, "clientRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligenceFlowIdentifiers clientSessionId](self, "clientSessionId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligenceFlowIdentifiers clientApplicationId](self, "clientApplicationId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligenceFlowIdentifiers clientGroupIdentifier](self, "clientGroupIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligenceFlowIdentifiers requestEventId](self, "requestEventId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v26[0] = CFSTR("sessionId");
  v12 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v12;
  v27[0] = v12;
  v26[1] = CFSTR("spanId");
  v13 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v13;
  v27[1] = v13;
  v26[2] = CFSTR("clientRequestId");
  v14 = (uint64_t)v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v4;
  v21 = (void *)v14;
  v27[2] = v14;
  v26[3] = CFSTR("clientSessionId");
  v15 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v5;
  v27[3] = v15;
  v26[4] = CFSTR("clientApplicationId");
  v16 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[4] = v16;
  v26[5] = CFSTR("clientGroupIdentifier");
  v17 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[5] = v17;
  v26[6] = CFSTR("requestEventId");
  v18 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[6] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (v9)
      goto LABEL_20;
LABEL_28:

    if (v8)
      goto LABEL_21;
    goto LABEL_29;
  }

  if (!v9)
    goto LABEL_28;
LABEL_20:
  if (v8)
    goto LABEL_21;
LABEL_29:

LABEL_21:
  if (!v7)

  if (v6)
  {
    if (v24)
      goto LABEL_25;
LABEL_31:

    if (v25)
      goto LABEL_26;
LABEL_32:

    goto LABEL_26;
  }

  if (!v24)
    goto LABEL_31;
LABEL_25:
  if (!v25)
    goto LABEL_32;
LABEL_26:

  return v19;
}

- (NSUUID)sessionId
{
  NSData *raw_sessionId;
  void *v3;

  raw_sessionId = self->_raw_sessionId;
  if (raw_sessionId)
  {
    objc_msgSend(MEMORY[0x1E0D02620], "convertValue:toType:", raw_sessionId, 3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSUUID *)v3;
}

- (NSUUID)requestEventId
{
  NSData *raw_requestEventId;
  void *v3;

  raw_requestEventId = self->_raw_requestEventId;
  if (raw_requestEventId)
  {
    objc_msgSend(MEMORY[0x1E0D02620], "convertValue:toType:", raw_requestEventId, 3);
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
  unint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMIntelligenceFlowIdentifiers sessionId](self, "sessionId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sessionId");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMIntelligenceFlowIdentifiers sessionId](self, "sessionId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sessionId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_26;
    }
    if (-[BMIntelligenceFlowIdentifiers hasSpanId](self, "hasSpanId") || objc_msgSend(v5, "hasSpanId"))
    {
      if (!-[BMIntelligenceFlowIdentifiers hasSpanId](self, "hasSpanId"))
        goto LABEL_26;
      if (!objc_msgSend(v5, "hasSpanId"))
        goto LABEL_26;
      v13 = -[BMIntelligenceFlowIdentifiers spanId](self, "spanId");
      if (v13 != objc_msgSend(v5, "spanId"))
        goto LABEL_26;
    }
    -[BMIntelligenceFlowIdentifiers clientRequestId](self, "clientRequestId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientRequestId");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v14 == (void *)v15)
    {

    }
    else
    {
      v16 = (void *)v15;
      -[BMIntelligenceFlowIdentifiers clientRequestId](self, "clientRequestId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "clientRequestId");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqual:", v18);

      if (!v19)
        goto LABEL_26;
    }
    -[BMIntelligenceFlowIdentifiers clientSessionId](self, "clientSessionId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientSessionId");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v20 == (void *)v21)
    {

    }
    else
    {
      v22 = (void *)v21;
      -[BMIntelligenceFlowIdentifiers clientSessionId](self, "clientSessionId");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "clientSessionId");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "isEqual:", v24);

      if (!v25)
        goto LABEL_26;
    }
    -[BMIntelligenceFlowIdentifiers clientApplicationId](self, "clientApplicationId");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientApplicationId");
    v27 = objc_claimAutoreleasedReturnValue();
    if (v26 == (void *)v27)
    {

    }
    else
    {
      v28 = (void *)v27;
      -[BMIntelligenceFlowIdentifiers clientApplicationId](self, "clientApplicationId");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "clientApplicationId");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v29, "isEqual:", v30);

      if (!v31)
        goto LABEL_26;
    }
    -[BMIntelligenceFlowIdentifiers clientGroupIdentifier](self, "clientGroupIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientGroupIdentifier");
    v33 = objc_claimAutoreleasedReturnValue();
    if (v32 == (void *)v33)
    {

    }
    else
    {
      v34 = (void *)v33;
      -[BMIntelligenceFlowIdentifiers clientGroupIdentifier](self, "clientGroupIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "clientGroupIdentifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v35, "isEqual:", v36);

      if (!v37)
      {
LABEL_26:
        v12 = 0;
LABEL_27:

        goto LABEL_28;
      }
    }
    -[BMIntelligenceFlowIdentifiers requestEventId](self, "requestEventId");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestEventId");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39 == v40)
    {
      v12 = 1;
    }
    else
    {
      -[BMIntelligenceFlowIdentifiers requestEventId](self, "requestEventId");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "requestEventId");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v41, "isEqual:", v42);

    }
    goto LABEL_27;
  }
  v12 = 0;
LABEL_28:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (unint64_t)spanId
{
  return self->_spanId;
}

- (BOOL)hasSpanId
{
  return self->_hasSpanId;
}

- (void)setHasSpanId:(BOOL)a3
{
  self->_hasSpanId = a3;
}

- (NSString)clientRequestId
{
  return self->_clientRequestId;
}

- (NSString)clientSessionId
{
  return self->_clientSessionId;
}

- (NSString)clientApplicationId
{
  return self->_clientApplicationId;
}

- (NSString)clientGroupIdentifier
{
  return self->_clientGroupIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_clientApplicationId, 0);
  objc_storeStrong((id *)&self->_clientSessionId, 0);
  objc_storeStrong((id *)&self->_clientRequestId, 0);
  objc_storeStrong((id *)&self->_raw_requestEventId, 0);
  objc_storeStrong((id *)&self->_raw_sessionId, 0);
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

    v4 = -[BMIntelligenceFlowIdentifiers initByReadFrom:]([BMIntelligenceFlowIdentifiers alloc], "initByReadFrom:", v7);
    v4[9] = 0;

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
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sessionId"), 6, 0, 1, 14, 3);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("spanId"), 0, 0, 2, 5, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clientRequestId"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clientSessionId"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clientApplicationId"), 2, 0, 5, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clientGroupIdentifier"), 2, 0, 6, 13, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("requestEventId"), 6, 0, 7, 14, 3);
  v11[0] = v2;
  v11[1] = v3;
  v11[2] = v4;
  v11[3] = v5;
  v11[4] = v6;
  v11[5] = v7;
  v11[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1E280;
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
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sessionId"), 1, 14, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("spanId"), 2, 5, 0, v2);
  v11[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clientRequestId"), 3, 13, 0);
  v11[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clientSessionId"), 4, 13, 0);
  v11[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clientApplicationId"), 5, 13, 0);
  v11[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clientGroupIdentifier"), 6, 13, 0);
  v11[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("requestEventId"), 7, 14, 0);
  v11[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
