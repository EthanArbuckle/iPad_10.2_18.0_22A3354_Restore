@implementation BMMessagesSharedWithYouFeedback

- (BMMessagesSharedWithYouFeedback)initWithClientIdentifier:(id)a3 feedbackType:(int)a4 feedbackCreationSecondsSinceReferenceDate:(id)a5 highlight:(id)a6 clientVariant:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  BMMessagesSharedWithYouFeedback *v17;
  double v18;
  objc_super v20;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)BMMessagesSharedWithYouFeedback;
  v17 = -[BMEventBase init](&v20, sel_init);
  if (v17)
  {
    v17->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v17->_clientIdentifier, a3);
    v17->_feedbackType = a4;
    if (v14)
    {
      v17->_hasFeedbackCreationSecondsSinceReferenceDate = 1;
      objc_msgSend(v14, "doubleValue");
    }
    else
    {
      v17->_hasFeedbackCreationSecondsSinceReferenceDate = 0;
      v18 = -1.0;
    }
    v17->_feedbackCreationSecondsSinceReferenceDate = v18;
    objc_storeStrong((id *)&v17->_highlight, a6);
    objc_storeStrong((id *)&v17->_clientVariant, a7);
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
  -[BMMessagesSharedWithYouFeedback clientIdentifier](self, "clientIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMMessagesSharedWithYouFeedbackUnifiedFeedbackTypeAsString(-[BMMessagesSharedWithYouFeedback feedbackType](self, "feedbackType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMessagesSharedWithYouFeedback feedbackCreationSecondsSinceReferenceDate](self, "feedbackCreationSecondsSinceReferenceDate");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMessagesSharedWithYouFeedback highlight](self, "highlight");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMessagesSharedWithYouFeedback clientVariant](self, "clientVariant");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMMessagesSharedWithYouFeedback with clientIdentifier: %@, feedbackType: %@, feedbackCreationSecondsSinceReferenceDate: %@, highlight: %@, clientVariant: %@"), v4, v5, v7, v8, v9);

  return (NSString *)v10;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMessagesSharedWithYouFeedback *v5;
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
  uint64_t v21;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  unint64_t v30;
  double v31;
  BMMessagesSharedWithYouFeedbackRankableSocialHighlight *v32;
  BMMessagesSharedWithYouFeedbackRankableSocialHighlight *highlight;
  void *v34;
  BMMessagesSharedWithYouFeedback *v35;
  objc_super v37;
  uint64_t v38;
  uint64_t v39;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)BMMessagesSharedWithYouFeedback;
  v5 = -[BMEventBase init](&v37, sel_init);
  if (!v5)
    goto LABEL_49;
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
          v21 = 32;
          goto LABEL_37;
        case 2u:
          v22 = 0;
          v23 = 0;
          v24 = 0;
          break;
        case 3u:
          v5->_hasFeedbackCreationSecondsSinceReferenceDate = 1;
          v29 = *v6;
          v30 = *(_QWORD *)&v4[v29];
          if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(double *)(*(_QWORD *)&v4[*v9] + v30);
            *(_QWORD *)&v4[v29] = v30 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0.0;
          }
          v5->_feedbackCreationSecondsSinceReferenceDate = v31;
          continue;
        case 4u:
          v38 = 0;
          v39 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_48;
          v32 = -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight initByReadFrom:]([BMMessagesSharedWithYouFeedbackRankableSocialHighlight alloc], "initByReadFrom:", v4);
          if (!v32)
            goto LABEL_48;
          highlight = v5->_highlight;
          v5->_highlight = v32;

          PBReaderRecallMark();
          continue;
        case 5u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 56;
LABEL_37:
          v34 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_48;
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
          goto LABEL_39;
        v22 += 7;
        v17 = v23++ >= 9;
        if (v17)
        {
          LODWORD(v24) = 0;
          goto LABEL_41;
        }
      }
      v4[*v8] = 1;
LABEL_39:
      if (v4[*v8])
        LODWORD(v24) = 0;
LABEL_41:
      if (v24 >= 0xC)
        LODWORD(v24) = 0;
      v5->_feedbackType = v24;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_48:
    v35 = 0;
  else
LABEL_49:
    v35 = v5;

  return v35;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_clientIdentifier)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  if (self->_hasFeedbackCreationSecondsSinceReferenceDate)
    PBDataWriterWriteDoubleField();
  if (self->_highlight)
  {
    PBDataWriterPlaceMark();
    -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight writeTo:](self->_highlight, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_clientVariant)
    PBDataWriterWriteStringField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMMessagesSharedWithYouFeedback writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMessagesSharedWithYouFeedback)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id *v10;
  id v11;
  id *v12;
  uint64_t v13;
  id *v14;
  uint64_t v15;
  BMMessagesSharedWithYouFeedback *v16;
  void *v17;
  void *v18;
  BMMessagesSharedWithYouFeedbackRankableSocialHighlight *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  id v27;
  id *v28;
  uint64_t v29;
  void *v30;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  id v36;
  id v37;
  uint64_t v38;
  id v39;
  id *v40;
  id *v41;
  id v42;
  id v43;
  BMMessagesSharedWithYouFeedback *v44;
  id v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  BMMessagesSharedWithYouFeedbackRankableSocialHighlight *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  _QWORD v55[3];

  v55[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("clientIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("feedbackType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = v9;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v16 = 0;
            goto LABEL_44;
          }
          v34 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v40 = a4;
          v35 = *MEMORY[0x1E0D025B8];
          v52 = *MEMORY[0x1E0CB2D50];
          v43 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("feedbackType"));
          v53 = v43;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = (id)objc_msgSend(v34, "initWithDomain:code:userInfo:", v35, 2, v17);
          a4 = 0;
          v16 = 0;
          *v40 = v36;
          goto LABEL_43;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMessagesSharedWithYouFeedbackUnifiedFeedbackTypeFromString(v9));
        v10 = (id *)objc_claimAutoreleasedReturnValue();
      }
      v41 = v10;
    }
    else
    {
      v41 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("feedbackCreationSecondsSinceReferenceDate"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v8;
    v44 = self;
    if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v43 = 0;
          v16 = 0;
          a4 = v41;
          goto LABEL_43;
        }
        v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v26 = *MEMORY[0x1E0D025B8];
        v50 = *MEMORY[0x1E0CB2D50];
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("feedbackCreationSecondsSinceReferenceDate"));
        v51 = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
        v19 = (BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)objc_claimAutoreleasedReturnValue();
        v27 = (id)objc_msgSend(v25, "initWithDomain:code:userInfo:", v26, 2, v19);
        v16 = 0;
        v43 = 0;
        v28 = a4;
        a4 = v41;
        *v28 = v27;
        goto LABEL_41;
      }
      v43 = v17;
    }
    else
    {
      v43 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("highlight"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v19 = 0;
LABEL_22:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("clientVariant"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            v39 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v38 = *MEMORY[0x1E0D025B8];
            v46 = *MEMORY[0x1E0CB2D50];
            v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("clientVariant"));
            v47 = v32;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *a4 = (id)objc_msgSend(v39, "initWithDomain:code:userInfo:", v38, 2, v33);

          }
          v16 = 0;
          v21 = 0;
          a4 = v41;
          goto LABEL_26;
        }
        v21 = v20;
      }
      else
      {
        v21 = 0;
      }
      a4 = v41;
      v16 = -[BMMessagesSharedWithYouFeedback initWithClientIdentifier:feedbackType:feedbackCreationSecondsSinceReferenceDate:highlight:clientVariant:](v44, "initWithClientIdentifier:feedbackType:feedbackCreationSecondsSinceReferenceDate:highlight:clientVariant:", v42, objc_msgSend(v41, "intValue"), v43, v19, v21);
      v44 = v16;
LABEL_26:

LABEL_41:
LABEL_42:

      self = v44;
      v8 = v42;
LABEL_43:

      goto LABEL_44;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = v18;
      v45 = 0;
      v19 = -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight initWithJSONDictionary:error:]([BMMessagesSharedWithYouFeedbackRankableSocialHighlight alloc], "initWithJSONDictionary:error:", v22, &v45);
      v23 = v45;
      if (!v23)
      {

        goto LABEL_22;
      }
      v24 = v23;
      if (a4)
        *a4 = objc_retainAutorelease(v23);

      v16 = 0;
      v18 = v22;
    }
    else
    {
      if (!a4)
      {
        v16 = 0;
        a4 = v41;
        goto LABEL_42;
      }
      v37 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v29 = *MEMORY[0x1E0D025B8];
      v48 = *MEMORY[0x1E0CB2D50];
      v19 = (BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("highlight"));
      v49 = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 = (id)objc_msgSend(v37, "initWithDomain:code:userInfo:", v29, 2, v30);

      v16 = 0;
    }
    a4 = v41;
    goto LABEL_41;
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
    goto LABEL_45;
  }
  v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v12 = a4;
  v13 = *MEMORY[0x1E0D025B8];
  v54 = *MEMORY[0x1E0CB2D50];
  v14 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("clientIdentifier"));
  v55[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, &v54, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13;
  a4 = v14;
  v8 = 0;
  v16 = 0;
  *v12 = (id)objc_msgSend(v11, "initWithDomain:code:userInfo:", v15, 2, v9);
LABEL_44:

LABEL_45:
  return v16;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  _QWORD v25[6];

  v25[5] = *MEMORY[0x1E0C80C00];
  -[BMMessagesSharedWithYouFeedback clientIdentifier](self, "clientIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMessagesSharedWithYouFeedback feedbackType](self, "feedbackType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[BMMessagesSharedWithYouFeedback hasFeedbackCreationSecondsSinceReferenceDate](self, "hasFeedbackCreationSecondsSinceReferenceDate")|| (-[BMMessagesSharedWithYouFeedback feedbackCreationSecondsSinceReferenceDate](self, "feedbackCreationSecondsSinceReferenceDate"), fabs(v5) == INFINITY))
  {
    v7 = 0;
  }
  else
  {
    -[BMMessagesSharedWithYouFeedback feedbackCreationSecondsSinceReferenceDate](self, "feedbackCreationSecondsSinceReferenceDate");
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMessagesSharedWithYouFeedback feedbackCreationSecondsSinceReferenceDate](self, "feedbackCreationSecondsSinceReferenceDate");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[BMMessagesSharedWithYouFeedback highlight](self, "highlight");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "jsonDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMMessagesSharedWithYouFeedback clientVariant](self, "clientVariant");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = CFSTR("clientIdentifier");
  v11 = (uint64_t)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v18 = v11;
  v25[0] = v11;
  v21 = CFSTR("feedbackType");
  v12 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v11, v20, v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[1] = v12;
  v22 = CFSTR("feedbackCreationSecondsSinceReferenceDate");
  v13 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[2] = v13;
  v23 = CFSTR("highlight");
  v14 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[3] = v14;
  v24 = CFSTR("clientVariant");
  v15 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[4] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v20, 5, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (v9)
      goto LABEL_17;
  }
  else
  {

    if (v9)
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
    if (v4)
      goto LABEL_19;
LABEL_24:

    if (v3)
      goto LABEL_20;
LABEL_25:

    goto LABEL_20;
  }
LABEL_23:

  if (!v4)
    goto LABEL_24;
LABEL_19:
  if (!v3)
    goto LABEL_25;
LABEL_20:

  return v16;
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
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMMessagesSharedWithYouFeedback clientIdentifier](self, "clientIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMMessagesSharedWithYouFeedback clientIdentifier](self, "clientIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "clientIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_15;
    }
    v13 = -[BMMessagesSharedWithYouFeedback feedbackType](self, "feedbackType");
    if (v13 != objc_msgSend(v5, "feedbackType"))
      goto LABEL_15;
    if (-[BMMessagesSharedWithYouFeedback hasFeedbackCreationSecondsSinceReferenceDate](self, "hasFeedbackCreationSecondsSinceReferenceDate")|| objc_msgSend(v5, "hasFeedbackCreationSecondsSinceReferenceDate"))
    {
      if (!-[BMMessagesSharedWithYouFeedback hasFeedbackCreationSecondsSinceReferenceDate](self, "hasFeedbackCreationSecondsSinceReferenceDate"))goto LABEL_15;
      if (!objc_msgSend(v5, "hasFeedbackCreationSecondsSinceReferenceDate"))
        goto LABEL_15;
      -[BMMessagesSharedWithYouFeedback feedbackCreationSecondsSinceReferenceDate](self, "feedbackCreationSecondsSinceReferenceDate");
      v15 = v14;
      objc_msgSend(v5, "feedbackCreationSecondsSinceReferenceDate");
      if (v15 != v16)
        goto LABEL_15;
    }
    -[BMMessagesSharedWithYouFeedback highlight](self, "highlight");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "highlight");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v17 == (void *)v18)
    {

    }
    else
    {
      v19 = (void *)v18;
      -[BMMessagesSharedWithYouFeedback highlight](self, "highlight");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "highlight");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "isEqual:", v21);

      if (!v22)
      {
LABEL_15:
        v12 = 0;
LABEL_16:

        goto LABEL_17;
      }
    }
    -[BMMessagesSharedWithYouFeedback clientVariant](self, "clientVariant");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientVariant");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24 == v25)
    {
      v12 = 1;
    }
    else
    {
      -[BMMessagesSharedWithYouFeedback clientVariant](self, "clientVariant");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "clientVariant");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v26, "isEqual:", v27);

    }
    goto LABEL_16;
  }
  v12 = 0;
LABEL_17:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (int)feedbackType
{
  return self->_feedbackType;
}

- (double)feedbackCreationSecondsSinceReferenceDate
{
  return self->_feedbackCreationSecondsSinceReferenceDate;
}

- (BOOL)hasFeedbackCreationSecondsSinceReferenceDate
{
  return self->_hasFeedbackCreationSecondsSinceReferenceDate;
}

- (void)setHasFeedbackCreationSecondsSinceReferenceDate:(BOOL)a3
{
  self->_hasFeedbackCreationSecondsSinceReferenceDate = a3;
}

- (BMMessagesSharedWithYouFeedbackRankableSocialHighlight)highlight
{
  return self->_highlight;
}

- (NSString)clientVariant
{
  return self->_clientVariant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientVariant, 0);
  objc_storeStrong((id *)&self->_highlight, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

+ (unsigned)latestDataVersion
{
  return 4;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  __objc2_class **v6;
  void *v7;
  _DWORD *v8;

  v5 = a3;
  if (a4 == 4)
  {
    v6 = off_1E5E4AEC8;
  }
  else
  {
    if (a4 != 3)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v6 = off_1E5E4AEE8;
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D82B90]), "initWithData:", v5);
  v8 = (_DWORD *)objc_msgSend(objc_alloc(*v6), "initByReadFrom:", v7);
  v8[5] = a4;

LABEL_7:
  return v8;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clientIdentifier"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("feedbackType"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("feedbackCreationSecondsSinceReferenceDate"), 1, 0, 3, 0, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("highlight_json"), 5, 1, &__block_literal_global_404);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clientVariant"), 2, 0, 5, 13, 0);
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
  return &unk_1E5F1FA98;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clientIdentifier"), 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("feedbackType"), 2, 4, 0, v2);
  v9[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("feedbackCreationSecondsSinceReferenceDate"), 3, 0, 0);
  v9[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("highlight"), 4, 14, objc_opt_class());
  v9[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clientVariant"), 5, 13, 0);
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __42__BMMessagesSharedWithYouFeedback_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "highlight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
