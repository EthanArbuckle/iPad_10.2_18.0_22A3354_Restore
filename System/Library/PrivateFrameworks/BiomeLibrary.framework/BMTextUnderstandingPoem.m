@implementation BMTextUnderstandingPoem

- (BMTextUnderstandingPoem)initWithSubject:(id)a3 predicate:(int)a4 object:(id)a5 conversationId:(id)a6 confidence:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  BMTextUnderstandingPoem *v17;
  double v18;
  objc_super v20;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)BMTextUnderstandingPoem;
  v17 = -[BMEventBase init](&v20, sel_init);
  if (v17)
  {
    v17->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v17->_subject, a3);
    v17->_predicate = a4;
    objc_storeStrong((id *)&v17->_object, a5);
    objc_storeStrong((id *)&v17->_conversationId, a6);
    if (v16)
    {
      v17->_hasConfidence = 1;
      objc_msgSend(v16, "doubleValue");
    }
    else
    {
      v17->_hasConfidence = 0;
      v18 = -1.0;
    }
    v17->_confidence = v18;
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
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMTextUnderstandingPoem subject](self, "subject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMTextUnderstandingPoemPredicateTypeAsString(-[BMTextUnderstandingPoem predicate](self, "predicate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMTextUnderstandingPoem object](self, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMTextUnderstandingPoem conversationId](self, "conversationId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[BMTextUnderstandingPoem confidence](self, "confidence");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMTextUnderstandingPoem with subject: %@, predicate: %@, object: %@, conversationId: %@, confidence: %@"), v4, v5, v6, v7, v9);

  return (NSString *)v10;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMTextUnderstandingPoem *v5;
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
  objc_class *v20;
  uint64_t v21;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  void *v29;
  uint64_t v30;
  NSString *conversationId;
  uint64_t v32;
  unint64_t v33;
  double v34;
  BMTextUnderstandingPoem *v35;
  objc_super v37;
  uint64_t v38;
  uint64_t v39;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)BMTextUnderstandingPoem;
  v5 = -[BMEventBase init](&v37, sel_init);
  if (!v5)
    goto LABEL_51;
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
          v38 = 0;
          v39 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_50;
          v20 = -[BMTextUnderstandingPoemEntity initByReadFrom:]([BMTextUnderstandingPoemEntity alloc], "initByReadFrom:", v4);
          if (!v20)
            goto LABEL_50;
          v21 = 32;
          goto LABEL_35;
        case 2u:
          v22 = 0;
          v23 = 0;
          v24 = 0;
          break;
        case 3u:
          v38 = 0;
          v39 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_50;
          v20 = -[BMTextUnderstandingPoemEntity initByReadFrom:]([BMTextUnderstandingPoemEntity alloc], "initByReadFrom:", v4);
          if (!v20)
            goto LABEL_50;
          v21 = 40;
LABEL_35:
          v29 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = v20;

          PBReaderRecallMark();
          continue;
        case 4u:
          PBReaderReadString();
          v30 = objc_claimAutoreleasedReturnValue();
          conversationId = v5->_conversationId;
          v5->_conversationId = (NSString *)v30;

          continue;
        case 5u:
          v5->_hasConfidence = 1;
          v32 = *v6;
          v33 = *(_QWORD *)&v4[v32];
          if (v33 <= 0xFFFFFFFFFFFFFFF7 && v33 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v34 = *(double *)(*(_QWORD *)&v4[*v9] + v33);
            *(_QWORD *)&v4[v32] = v33 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v34 = 0.0;
          }
          v5->_confidence = v34;
          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_50;
          continue;
      }
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
      if (v24 >= 3)
        LODWORD(v24) = 0;
      v5->_predicate = v24;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_50:
    v35 = 0;
  else
LABEL_51:
    v35 = v5;

  return v35;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_subject)
  {
    PBDataWriterPlaceMark();
    -[BMTextUnderstandingPoemEntity writeTo:](self->_subject, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  PBDataWriterWriteUint32Field();
  if (self->_object)
  {
    PBDataWriterPlaceMark();
    -[BMTextUnderstandingPoemEntity writeTo:](self->_object, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_conversationId)
    PBDataWriterWriteStringField();
  if (self->_hasConfidence)
    PBDataWriterWriteDoubleField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMTextUnderstandingPoem writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMTextUnderstandingPoem)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BMTextUnderstandingPoemEntity *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  BMTextUnderstandingPoem *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  id *v18;
  void *v19;
  BMTextUnderstandingPoemEntity *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  BMTextUnderstandingPoemEntity *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  BMTextUnderstandingPoemEntity *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v42;
  id v43;
  id v44;
  void *v45;
  BMTextUnderstandingPoemEntity *v46;
  void *v47;
  BMTextUnderstandingPoem *v48;
  id v49;
  id v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  BMTextUnderstandingPoemEntity *v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  _QWORD v60[3];

  v60[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subject"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v7;
    v50 = 0;
    v8 = -[BMTextUnderstandingPoemEntity initWithJSONDictionary:error:]([BMTextUnderstandingPoemEntity alloc], "initWithJSONDictionary:error:", v10, &v50);
    v11 = v50;
    if (v11)
    {
      v12 = v11;
      if (a4)
        *a4 = objc_retainAutorelease(v11);

      v13 = 0;
      goto LABEL_55;
    }

LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("predicate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = self;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = v9;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v10 = 0;
            v13 = 0;
            goto LABEL_54;
          }
          v36 = v8;
          v37 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v38 = *MEMORY[0x1E0D025B8];
          v57 = *MEMORY[0x1E0CB2D50];
          v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("predicate"));
          v58 = v24;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
          v39 = objc_claimAutoreleasedReturnValue();
          v40 = v37;
          v8 = v36;
          v46 = (BMTextUnderstandingPoemEntity *)v39;
          v47 = 0;
          v13 = 0;
          *a4 = (id)objc_msgSend(v40, "initWithDomain:code:userInfo:", v38, 2);
          goto LABEL_52;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMTextUnderstandingPoemPredicateTypeFromString(v9));
        v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      v47 = v14;
    }
    else
    {
      v47 = 0;
    }
    v45 = v9;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("object"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = a4;
    if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v46 = 0;
LABEL_22:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("conversationId"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v8;
      if (v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v18)
          {
            v13 = 0;
            v21 = 0;
            v9 = v45;
            goto LABEL_30;
          }
          v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v32 = *MEMORY[0x1E0D025B8];
          v53 = *MEMORY[0x1E0CB2D50];
          v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("conversationId"));
          v54 = v23;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = (id)objc_msgSend(v43, "initWithDomain:code:userInfo:", v32, 2, v22);
          v13 = 0;
          v21 = 0;
          *v18 = v33;
          goto LABEL_29;
        }
        v21 = v19;
      }
      else
      {
        v21 = 0;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("confidence"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v18)
          {
            v44 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v42 = *MEMORY[0x1E0D025B8];
            v51 = *MEMORY[0x1E0CB2D50];
            v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("confidence"));
            v52 = v34;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *v18 = (id)objc_msgSend(v44, "initWithDomain:code:userInfo:", v42, 2, v35);

          }
          v23 = 0;
          v13 = 0;
          goto LABEL_29;
        }
        v23 = v22;
      }
      else
      {
        v23 = 0;
      }
      v13 = -[BMTextUnderstandingPoem initWithSubject:predicate:object:conversationId:confidence:](v48, "initWithSubject:predicate:object:conversationId:confidence:", v20, objc_msgSend(v47, "intValue"), v46, v21, v23);
      v48 = v13;
LABEL_29:
      v9 = v45;

LABEL_30:
      v24 = v17;
      v8 = v20;
LABEL_52:

      v17 = v24;
      self = v48;
LABEL_53:

      v10 = v47;
LABEL_54:

      goto LABEL_55;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = v17;
      v49 = 0;
      v46 = -[BMTextUnderstandingPoemEntity initWithJSONDictionary:error:]([BMTextUnderstandingPoemEntity alloc], "initWithJSONDictionary:error:", v24, &v49);
      v25 = v49;
      if (!v25)
      {

        goto LABEL_22;
      }
      v26 = v25;
      if (a4)
        *a4 = objc_retainAutorelease(v25);

      v13 = 0;
    }
    else
    {
      if (!a4)
      {
        v13 = 0;
        v9 = v45;
        goto LABEL_53;
      }
      v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v28 = v8;
      v29 = *MEMORY[0x1E0D025B8];
      v55 = *MEMORY[0x1E0CB2D50];
      v46 = (BMTextUnderstandingPoemEntity *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("object"));
      v56 = v46;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v29;
      v8 = v28;
      *a4 = (id)objc_msgSend(v27, "initWithDomain:code:userInfo:", v31, 2, v30);

      v13 = 0;
      v24 = v17;
    }
    v9 = v45;
    goto LABEL_52;
  }
  if (a4)
  {
    v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v16 = *MEMORY[0x1E0D025B8];
    v59 = *MEMORY[0x1E0CB2D50];
    v8 = (BMTextUnderstandingPoemEntity *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("subject"));
    v60[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, &v59, 1);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    *a4 = (id)objc_msgSend(v15, "initWithDomain:code:userInfo:", v16, 2, v10);
LABEL_55:

    goto LABEL_56;
  }
  v13 = 0;
LABEL_56:

  return v13;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
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
  -[BMTextUnderstandingPoem subject](self, "subject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMTextUnderstandingPoem predicate](self, "predicate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMTextUnderstandingPoem object](self, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "jsonDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMTextUnderstandingPoem conversationId](self, "conversationId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[BMTextUnderstandingPoem hasConfidence](self, "hasConfidence")
    || (-[BMTextUnderstandingPoem confidence](self, "confidence"), fabs(v9) == INFINITY))
  {
    v11 = 0;
  }
  else
  {
    -[BMTextUnderstandingPoem confidence](self, "confidence");
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[BMTextUnderstandingPoem confidence](self, "confidence");
    objc_msgSend(v10, "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21 = CFSTR("subject");
  v12 = (uint64_t)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v19 = v12;
  v26[0] = v12;
  v22 = CFSTR("predicate");
  v13 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v12, v21, v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26[1] = v13;
  v23 = CFSTR("object");
  v14 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26[2] = v14;
  v24 = CFSTR("conversationId");
  v15 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26[3] = v15;
  v25 = CFSTR("confidence");
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
    if (v8)
      goto LABEL_17;
  }
  else
  {

    if (v8)
    {
LABEL_17:
      if (v7)
        goto LABEL_18;
      goto LABEL_23;
    }
  }

  if (v7)
  {
LABEL_18:
    if (v5)
      goto LABEL_19;
LABEL_24:

    if (v4)
      goto LABEL_20;
LABEL_25:

    goto LABEL_20;
  }
LABEL_23:

  if (!v5)
    goto LABEL_24;
LABEL_19:
  if (!v4)
    goto LABEL_25;
LABEL_20:

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
  BOOL v12;
  int v13;
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
  double v26;
  double v27;
  double v28;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMTextUnderstandingPoem subject](self, "subject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMTextUnderstandingPoem subject](self, "subject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "subject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_21;
    }
    v13 = -[BMTextUnderstandingPoem predicate](self, "predicate");
    if (v13 == objc_msgSend(v5, "predicate"))
    {
      -[BMTextUnderstandingPoem object](self, "object");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "object");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

      }
      else
      {
        v16 = (void *)v15;
        -[BMTextUnderstandingPoem object](self, "object");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "object");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "isEqual:", v18);

        if (!v19)
          goto LABEL_21;
      }
      -[BMTextUnderstandingPoem conversationId](self, "conversationId");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "conversationId");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v20 == (void *)v21)
      {

      }
      else
      {
        v22 = (void *)v21;
        -[BMTextUnderstandingPoem conversationId](self, "conversationId");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "conversationId");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "isEqual:", v24);

        if (!v25)
          goto LABEL_21;
      }
      if (!-[BMTextUnderstandingPoem hasConfidence](self, "hasConfidence")
        && !objc_msgSend(v5, "hasConfidence"))
      {
        v12 = 1;
        goto LABEL_22;
      }
      if (-[BMTextUnderstandingPoem hasConfidence](self, "hasConfidence")
        && objc_msgSend(v5, "hasConfidence"))
      {
        -[BMTextUnderstandingPoem confidence](self, "confidence");
        v27 = v26;
        objc_msgSend(v5, "confidence");
        v12 = v27 == v28;
LABEL_22:

        goto LABEL_23;
      }
    }
LABEL_21:
    v12 = 0;
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

- (BMTextUnderstandingPoemEntity)subject
{
  return self->_subject;
}

- (int)predicate
{
  return self->_predicate;
}

- (BMTextUnderstandingPoemEntity)object
{
  return self->_object;
}

- (NSString)conversationId
{
  return self->_conversationId;
}

- (double)confidence
{
  return self->_confidence;
}

- (BOOL)hasConfidence
{
  return self->_hasConfidence;
}

- (void)setHasConfidence:(BOOL)a3
{
  self->_hasConfidence = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationId, 0);
  objc_storeStrong((id *)&self->_object, 0);
  objc_storeStrong((id *)&self->_subject, 0);
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

    v4 = -[BMTextUnderstandingPoem initByReadFrom:]([BMTextUnderstandingPoem alloc], "initByReadFrom:", v7);
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
  void *v6;
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("subject_json"), 5, 1, &__block_literal_global_195);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("predicate"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("object_json"), 5, 1, &__block_literal_global_196_20959);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("conversationId"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("confidence"), 1, 0, 5, 0, 0);
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
  return &unk_1E5F1BB80;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("subject"), 1, 14, objc_opt_class());
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("predicate"), 2, 4, 0, v2);
  v9[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("object"), 3, 14, objc_opt_class());
  v9[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("conversationId"), 4, 13, 0);
  v9[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("confidence"), 5, 0, 0);
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __34__BMTextUnderstandingPoem_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __34__BMTextUnderstandingPoem_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
