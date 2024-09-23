@implementation BMIntelligenceFlowTranscriptDatastreamEvent

- (BMIntelligenceFlowTranscriptDatastreamEvent)initWithAbsoluteTimestamp:(id)a3 monotonicTimestamp:(id)a4 identifiers:(id)a5 eventId:(id)a6 eventType:(id)a7 data:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  BMIntelligenceFlowTranscriptDatastreamEvent *v18;
  double v19;
  id v21;
  id v22;
  objc_super v23;

  v14 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)BMIntelligenceFlowTranscriptDatastreamEvent;
  v18 = -[BMEventBase init](&v23, sel_init);
  if (v18)
  {
    v18->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion", v21, v22);
    if (v14)
    {
      v18->_hasRaw_absoluteTimestamp = 1;
      objc_msgSend(v14, "timeIntervalSinceReferenceDate");
    }
    else
    {
      v18->_hasRaw_absoluteTimestamp = 0;
      v19 = -1.0;
    }
    v18->_raw_absoluteTimestamp = v19;
    objc_storeStrong((id *)&v18->_monotonicTimestamp, a4);
    objc_storeStrong((id *)&v18->_identifiers, a5);
    objc_storeStrong((id *)&v18->_eventId, a6);
    objc_storeStrong((id *)&v18->_eventType, a7);
    objc_storeStrong((id *)&v18->_data, a8);
  }

  return v18;
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

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMIntelligenceFlowTranscriptDatastreamEvent absoluteTimestamp](self, "absoluteTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligenceFlowTranscriptDatastreamEvent monotonicTimestamp](self, "monotonicTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligenceFlowTranscriptDatastreamEvent identifiers](self, "identifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligenceFlowTranscriptDatastreamEvent eventId](self, "eventId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligenceFlowTranscriptDatastreamEvent eventType](self, "eventType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligenceFlowTranscriptDatastreamEvent data](self, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMIntelligenceFlowTranscriptDatastreamEvent with absoluteTimestamp: %@, monotonicTimestamp: %@, identifiers: %@, eventId: %@, eventType: %@, data: %@"), v4, v5, v6, v7, v8, v9);

  return (NSString *)v10;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMIntelligenceFlowTranscriptDatastreamEvent *v5;
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
  int v18;
  uint64_t v20;
  unint64_t v21;
  double v22;
  objc_class *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  BMIntelligenceFlowTranscriptDatastreamEvent *v29;
  objc_super v31;
  uint64_t v32;
  uint64_t v33;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)BMIntelligenceFlowTranscriptDatastreamEvent;
  v5 = -[BMEventBase init](&v31, sel_init);
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
        if (v11++ >= 9)
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
          v5->_hasRaw_absoluteTimestamp = 1;
          v20 = *v6;
          v21 = *(_QWORD *)&v4[v20];
          if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v22 = *(double *)(*(_QWORD *)&v4[*v9] + v21);
            *(_QWORD *)&v4[v20] = v21 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v22 = 0.0;
          }
          v5->_raw_absoluteTimestamp = v22;
          break;
        case 2u:
          v32 = 0;
          v33 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_40;
          v23 = -[BMMonotonicTimestamp initByReadFrom:]([BMMonotonicTimestamp alloc], "initByReadFrom:", v4);
          if (!v23)
            goto LABEL_40;
          v24 = 40;
          goto LABEL_33;
        case 3u:
          v32 = 0;
          v33 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_40;
          v23 = -[BMIntelligenceFlowIdentifiers initByReadFrom:]([BMIntelligenceFlowIdentifiers alloc], "initByReadFrom:", v4);
          if (!v23)
            goto LABEL_40;
          v24 = 48;
LABEL_33:
          v27 = *(Class *)((char *)&v5->super.super.isa + v24);
          *(Class *)((char *)&v5->super.super.isa + v24) = v23;

          PBReaderRecallMark();
          break;
        case 4u:
          PBReaderReadString();
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = 56;
          goto LABEL_35;
        case 5u:
          PBReaderReadString();
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = 64;
          goto LABEL_35;
        case 6u:
          PBReaderReadData();
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = 72;
LABEL_35:
          v28 = *(Class *)((char *)&v5->super.super.isa + v26);
          *(Class *)((char *)&v5->super.super.isa + v26) = (Class)v25;

          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_40;
          break;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_40:
    v29 = 0;
  else
LABEL_41:
    v29 = v5;

  return v29;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_hasRaw_absoluteTimestamp)
    PBDataWriterWriteDoubleField();
  if (self->_monotonicTimestamp)
  {
    PBDataWriterPlaceMark();
    -[BMMonotonicTimestamp writeTo:](self->_monotonicTimestamp, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_identifiers)
  {
    PBDataWriterPlaceMark();
    -[BMIntelligenceFlowIdentifiers writeTo:](self->_identifiers, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_eventId)
    PBDataWriterWriteStringField();
  if (self->_eventType)
    PBDataWriterWriteStringField();
  if (self->_data)
    PBDataWriterWriteDataField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMIntelligenceFlowTranscriptDatastreamEvent writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMIntelligenceFlowTranscriptDatastreamEvent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  BMIntelligenceFlowTranscriptDatastreamEvent *v18;
  objc_class *v19;
  id v20;
  id v21;
  double v22;
  double v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id *v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  id *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  void *v45;
  void *v46;
  id v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  id v52;
  id v53;
  id v54;
  id v55;
  void *v56;
  BMMonotonicTimestamp *v57;
  BMIntelligenceFlowIdentifiers *v58;
  BMIntelligenceFlowTranscriptDatastreamEvent *v59;
  id *v60;
  id v61;
  id v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  BMIntelligenceFlowIdentifiers *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  _QWORD v74[3];

  v74[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("absoluteTimestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = (objc_class *)MEMORY[0x1E0C99D68];
      v20 = v7;
      v21 = [v19 alloc];
      objc_msgSend(v20, "doubleValue");
      v23 = v22;

      v8 = (id)objc_msgSend(v21, "initWithTimeIntervalSinceReferenceDate:", v23);
    }
    else
    {
      v29 = a4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v30 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
        objc_msgSend(v30, "dateFromString:", v7);
        v8 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v8 = 0;
            v18 = 0;
            goto LABEL_62;
          }
          v48 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v49 = *MEMORY[0x1E0D025B8];
          v73 = *MEMORY[0x1E0CB2D50];
          v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("absoluteTimestamp"));
          v74[0] = v24;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, &v73, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = (id)objc_msgSend(v48, "initWithDomain:code:userInfo:", v49, 2, v17);
          v8 = 0;
          v18 = 0;
          *v29 = v50;
          goto LABEL_60;
        }
        v8 = v7;
      }
    }
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("monotonicTimestamp"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v56 = v7;
    v57 = 0;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = v9;
    v62 = 0;
    v57 = -[BMMonotonicTimestamp initWithJSONDictionary:error:]([BMMonotonicTimestamp alloc], "initWithJSONDictionary:error:", v24, &v62);
    v25 = v62;
    if (v25)
    {
      v26 = v25;
      if (a4)
        *a4 = objc_retainAutorelease(v25);

      v18 = 0;
      v17 = v57;
      goto LABEL_60;
    }
    v56 = v7;

LABEL_7:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifiers"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v58 = 0;
      v59 = self;
LABEL_10:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("eventId"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v8;
      if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v18 = 0;
            v12 = 0;
            v17 = v57;
            goto LABEL_57;
          }
          v40 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v41 = a4;
          v42 = *MEMORY[0x1E0D025B8];
          v67 = *MEMORY[0x1E0CB2D50];
          v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("eventId"));
          v68 = v14;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 0;
          *v41 = (id)objc_msgSend(v40, "initWithDomain:code:userInfo:", v42, 2, v13);
          v12 = 0;
          goto LABEL_71;
        }
        v12 = v11;
      }
      else
      {
        v12 = 0;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("eventType"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v12;
      if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v14 = 0;
        goto LABEL_16;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = v13;
LABEL_16:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("data"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v16 = 0;
LABEL_19:
          v17 = v57;
          v18 = -[BMIntelligenceFlowTranscriptDatastreamEvent initWithAbsoluteTimestamp:monotonicTimestamp:identifiers:eventId:eventType:data:](v59, "initWithAbsoluteTimestamp:monotonicTimestamp:identifiers:eventId:eventType:data:", v55, v57, v58, v54, v14, v16);
          v59 = v18;
LABEL_55:

          v12 = v54;
LABEL_56:

LABEL_57:
          self = v59;
          v8 = v55;
          goto LABEL_58;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v16 = v15;
          goto LABEL_19;
        }
        if (a4)
        {
          v53 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v51 = *MEMORY[0x1E0D025B8];
          v63 = *MEMORY[0x1E0CB2D50];
          v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSData"), objc_opt_class(), CFSTR("data"));
          v64 = v45;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *a4 = (id)objc_msgSend(v53, "initWithDomain:code:userInfo:", v51, 2, v46);

        }
        v16 = 0;
        v18 = 0;
LABEL_54:
        v17 = v57;
        goto LABEL_55;
      }
      if (a4)
      {
        v52 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v43 = *MEMORY[0x1E0D025B8];
        v65 = *MEMORY[0x1E0CB2D50];
        v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("eventType"));
        v66 = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = (id)objc_msgSend(v52, "initWithDomain:code:userInfo:", v43, 2, v15);
        v18 = 0;
        v14 = 0;
        *a4 = v44;
        goto LABEL_54;
      }
      v14 = 0;
      v18 = 0;
LABEL_71:
      v17 = v57;
      goto LABEL_56;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v10;
      v61 = 0;
      v58 = -[BMIntelligenceFlowIdentifiers initWithJSONDictionary:error:]([BMIntelligenceFlowIdentifiers alloc], "initWithJSONDictionary:error:", v12, &v61);
      v27 = v61;
      if (!v27)
      {
        v59 = self;

        goto LABEL_10;
      }
      v28 = v27;
      if (a4)
        *a4 = objc_retainAutorelease(v27);

      v18 = 0;
    }
    else
    {
      if (!a4)
      {
        v18 = 0;
        v17 = v57;
        goto LABEL_59;
      }
      v36 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v37 = v8;
      v38 = *MEMORY[0x1E0D025B8];
      v69 = *MEMORY[0x1E0CB2D50];
      v58 = (BMIntelligenceFlowIdentifiers *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("identifiers"));
      v70 = v58;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v39 = v38;
      v8 = v37;
      v18 = 0;
      *a4 = (id)objc_msgSend(v36, "initWithDomain:code:userInfo:", v39, 2, v12);
    }
    v17 = v57;
LABEL_58:

LABEL_59:
    v24 = v9;
    v7 = v56;
    goto LABEL_60;
  }
  if (!a4)
  {
    v18 = 0;
    goto LABEL_61;
  }
  v31 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v32 = v8;
  v33 = *MEMORY[0x1E0D025B8];
  v71 = *MEMORY[0x1E0CB2D50];
  v60 = a4;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("monotonicTimestamp"));
  v72 = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v33;
  v8 = v32;
  *v60 = (id)objc_msgSend(v31, "initWithDomain:code:userInfo:", v35, 2, v34);

  v18 = 0;
  v24 = v9;
LABEL_60:

  v9 = v24;
LABEL_61:

LABEL_62:
  return v18;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[6];
  _QWORD v28[7];

  v28[6] = *MEMORY[0x1E0C80C00];
  -[BMIntelligenceFlowTranscriptDatastreamEvent absoluteTimestamp](self, "absoluteTimestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[BMIntelligenceFlowTranscriptDatastreamEvent absoluteTimestamp](self, "absoluteTimestamp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    objc_msgSend(v4, "numberWithDouble:");
    v6 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  -[BMIntelligenceFlowTranscriptDatastreamEvent monotonicTimestamp](self, "monotonicTimestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "jsonDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMIntelligenceFlowTranscriptDatastreamEvent identifiers](self, "identifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "jsonDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMIntelligenceFlowTranscriptDatastreamEvent eventId](self, "eventId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligenceFlowTranscriptDatastreamEvent eventType](self, "eventType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligenceFlowTranscriptDatastreamEvent data](self, "data");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "base64EncodedStringWithOptions:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v27[0] = CFSTR("absoluteTimestamp");
  v15 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v15;
  v26 = (void *)v6;
  v28[0] = v15;
  v27[1] = CFSTR("monotonicTimestamp");
  v16 = (uint64_t)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v23 = v16;
  v28[1] = v16;
  v27[2] = CFSTR("identifiers");
  v17 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v16, v25);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[2] = v17;
  v27[3] = CFSTR("eventId");
  v18 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[3] = v18;
  v27[4] = CFSTR("eventType");
  v19 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[4] = v19;
  v27[5] = CFSTR("data");
  v20 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[5] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 6, v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    if (v12)
      goto LABEL_18;
  }
  else
  {

    if (v12)
    {
LABEL_18:
      if (v11)
        goto LABEL_19;
      goto LABEL_26;
    }
  }

  if (v11)
  {
LABEL_19:
    if (v10)
      goto LABEL_20;
LABEL_27:

    if (v8)
      goto LABEL_21;
    goto LABEL_28;
  }
LABEL_26:

  if (!v10)
    goto LABEL_27;
LABEL_20:
  if (v8)
    goto LABEL_21;
LABEL_28:

LABEL_21:
  if (!v26)

  return v21;
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
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMIntelligenceFlowTranscriptDatastreamEvent absoluteTimestamp](self, "absoluteTimestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteTimestamp");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMIntelligenceFlowTranscriptDatastreamEvent absoluteTimestamp](self, "absoluteTimestamp");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteTimestamp");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_21;
    }
    -[BMIntelligenceFlowTranscriptDatastreamEvent monotonicTimestamp](self, "monotonicTimestamp");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "monotonicTimestamp");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMIntelligenceFlowTranscriptDatastreamEvent monotonicTimestamp](self, "monotonicTimestamp");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "monotonicTimestamp");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_21;
    }
    -[BMIntelligenceFlowTranscriptDatastreamEvent identifiers](self, "identifiers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifiers");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMIntelligenceFlowTranscriptDatastreamEvent identifiers](self, "identifiers");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifiers");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_21;
    }
    -[BMIntelligenceFlowTranscriptDatastreamEvent eventId](self, "eventId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "eventId");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMIntelligenceFlowTranscriptDatastreamEvent eventId](self, "eventId");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "eventId");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_21;
    }
    -[BMIntelligenceFlowTranscriptDatastreamEvent eventType](self, "eventType");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "eventType");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v31 == (void *)v32)
    {

    }
    else
    {
      v33 = (void *)v32;
      -[BMIntelligenceFlowTranscriptDatastreamEvent eventType](self, "eventType");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "eventType");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqual:", v35);

      if (!v36)
      {
LABEL_21:
        v12 = 0;
LABEL_22:

        goto LABEL_23;
      }
    }
    -[BMIntelligenceFlowTranscriptDatastreamEvent data](self, "data");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "data");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38 == v39)
    {
      v12 = 1;
    }
    else
    {
      -[BMIntelligenceFlowTranscriptDatastreamEvent data](self, "data");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "data");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v40, "isEqual:", v41);

    }
    goto LABEL_22;
  }
  v12 = 0;
LABEL_23:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BMMonotonicTimestamp)monotonicTimestamp
{
  return self->_monotonicTimestamp;
}

- (BMIntelligenceFlowIdentifiers)identifiers
{
  return self->_identifiers;
}

- (NSString)eventId
{
  return self->_eventId;
}

- (NSString)eventType
{
  return self->_eventType;
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_eventType, 0);
  objc_storeStrong((id *)&self->_eventId, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_monotonicTimestamp, 0);
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

    v4 = -[BMIntelligenceFlowTranscriptDatastreamEvent initByReadFrom:]([BMIntelligenceFlowTranscriptDatastreamEvent alloc], "initByReadFrom:", v7);
    v4[8] = 0;

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
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("absoluteTimestamp"), 3, 0, 1, 0, 1);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("monotonicTimestamp_json"), 5, 1, &__block_literal_global_75976);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("identifiers_json"), 5, 1, &__block_literal_global_41_75977);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("eventId"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("eventType"), 2, 0, 5, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("data"), 4, 0, 6, 14, 0);
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  v10[4] = v6;
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1FF30;
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
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("absoluteTimestamp"), 1, 0, 0);
  v10[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("monotonicTimestamp"), 2, 14, objc_opt_class());
  v10[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("identifiers"), 3, 14, objc_opt_class());
  v10[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("eventId"), 4, 13, 0);
  v10[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("eventType"), 5, 13, 0);
  v10[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("data"), 6, 14, 0);
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __54__BMIntelligenceFlowTranscriptDatastreamEvent_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __54__BMIntelligenceFlowTranscriptDatastreamEvent_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "monotonicTimestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
