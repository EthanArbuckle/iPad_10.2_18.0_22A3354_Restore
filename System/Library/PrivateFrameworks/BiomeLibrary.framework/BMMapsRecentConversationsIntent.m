@implementation BMMapsRecentConversationsIntent

- (BMMapsRecentConversationsIntent)initWithContactInformation:(id)a3 actionType:(int)a4 predictionTimestamp:(id)a5 predictionExpiration:(id)a6 bundleID:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  BMMapsRecentConversationsIntent *v17;
  double v18;
  double v19;
  objc_super v21;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)BMMapsRecentConversationsIntent;
  v17 = -[BMEventBase init](&v21, sel_init);
  if (v17)
  {
    v17->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v17->_contactInformation, a3);
    v17->_actionType = a4;
    if (v14)
    {
      v17->_hasRaw_predictionTimestamp = 1;
      objc_msgSend(v14, "timeIntervalSince1970");
    }
    else
    {
      v17->_hasRaw_predictionTimestamp = 0;
      v18 = -1.0;
    }
    v17->_raw_predictionTimestamp = v18;
    if (v15)
    {
      v17->_hasRaw_predictionExpiration = 1;
      objc_msgSend(v15, "timeIntervalSince1970");
    }
    else
    {
      v17->_hasRaw_predictionExpiration = 0;
      v19 = -1.0;
    }
    v17->_raw_predictionExpiration = v19;
    objc_storeStrong((id *)&v17->_bundleID, a7);
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
  -[BMMapsRecentConversationsIntent contactInformation](self, "contactInformation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMMapsRecentConversationsIntentActionTypeAsString(-[BMMapsRecentConversationsIntent actionType](self, "actionType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMapsRecentConversationsIntent predictionTimestamp](self, "predictionTimestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMapsRecentConversationsIntent predictionExpiration](self, "predictionExpiration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMapsRecentConversationsIntent bundleID](self, "bundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMMapsRecentConversationsIntent with contactInformation: %@, actionType: %@, predictionTimestamp: %@, predictionExpiration: %@, bundleID: %@"), v4, v5, v6, v7, v8);

  return (NSString *)v9;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMapsRecentConversationsIntent *v5;
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
  BMMapsRecentConversationsIntentContactInformation *v20;
  BMMapsRecentConversationsIntentContactInformation *contactInformation;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  unint64_t v30;
  objc_class *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  NSString *bundleID;
  uint64_t v36;
  BMMapsRecentConversationsIntent *v37;
  objc_super v39;
  uint64_t v40;
  uint64_t v41;

  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)BMMapsRecentConversationsIntent;
  v5 = -[BMEventBase init](&v39, sel_init);
  if (!v5)
    goto LABEL_53;
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
          v40 = 0;
          v41 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_52;
          v20 = -[BMMapsRecentConversationsIntentContactInformation initByReadFrom:]([BMMapsRecentConversationsIntentContactInformation alloc], "initByReadFrom:", v4);
          if (!v20)
            goto LABEL_52;
          contactInformation = v5->_contactInformation;
          v5->_contactInformation = v20;

          PBReaderRecallMark();
          continue;
        case 2u:
          v22 = 0;
          v23 = 0;
          v24 = 0;
          break;
        case 3u:
          v5->_hasRaw_predictionTimestamp = 1;
          v29 = *v6;
          v30 = *(_QWORD *)&v4[v29];
          if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v30);
            *(_QWORD *)&v4[v29] = v30 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v36 = 24;
          goto LABEL_49;
        case 4u:
          v5->_hasRaw_predictionExpiration = 1;
          v32 = *v6;
          v33 = *(_QWORD *)&v4[v32];
          if (v33 <= 0xFFFFFFFFFFFFFFF7 && v33 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v33);
            *(_QWORD *)&v4[v32] = v33 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v36 = 40;
LABEL_49:
          *(Class *)((char *)&v5->super.super.isa + v36) = v31;
          continue;
        case 5u:
          PBReaderReadString();
          v34 = objc_claimAutoreleasedReturnValue();
          bundleID = v5->_bundleID;
          v5->_bundleID = (NSString *)v34;

          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_52;
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
          goto LABEL_40;
        v22 += 7;
        v17 = v23++ >= 9;
        if (v17)
        {
          LODWORD(v24) = 0;
          goto LABEL_42;
        }
      }
      v4[*v8] = 1;
LABEL_40:
      if (v4[*v8])
        LODWORD(v24) = 0;
LABEL_42:
      if (v24 >= 0x13)
        LODWORD(v24) = 0;
      v5->_actionType = v24;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_52:
    v37 = 0;
  else
LABEL_53:
    v37 = v5;

  return v37;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_contactInformation)
  {
    PBDataWriterPlaceMark();
    -[BMMapsRecentConversationsIntentContactInformation writeTo:](self->_contactInformation, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  PBDataWriterWriteUint32Field();
  if (self->_hasRaw_predictionTimestamp)
    PBDataWriterWriteDoubleField();
  if (self->_hasRaw_predictionExpiration)
    PBDataWriterWriteDoubleField();
  if (self->_bundleID)
    PBDataWriterWriteStringField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMMapsRecentConversationsIntent writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMapsRecentConversationsIntent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  BMMapsRecentConversationsIntent *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  objc_class *v17;
  id v18;
  id v19;
  double v20;
  double v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  objc_class *v26;
  id v27;
  id v28;
  double v29;
  double v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  id v45;
  id v46;
  id *v47;
  void *v48;
  id v49;
  void *v50;
  BMMapsRecentConversationsIntentContactInformation *v51;
  id v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  _QWORD v62[3];

  v62[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("contactInformation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v51 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v7;
    v52 = 0;
    v51 = -[BMMapsRecentConversationsIntentContactInformation initWithJSONDictionary:error:]([BMMapsRecentConversationsIntentContactInformation alloc], "initWithJSONDictionary:error:", v9, &v52);
    v10 = v52;
    if (v10)
    {
      v11 = v10;
      if (a4)
        *a4 = objc_retainAutorelease(v10);

      v12 = 0;
      goto LABEL_51;
    }

LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("actionType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = v8;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v9 = 0;
            v12 = 0;
            goto LABEL_50;
          }
          v33 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v34 = *MEMORY[0x1E0D025B8];
          v59 = *MEMORY[0x1E0CB2D50];
          v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("actionType"));
          v60 = v48;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = 0;
          v12 = 0;
          *a4 = (id)objc_msgSend(v33, "initWithDomain:code:userInfo:", v34, 2, v16);
LABEL_49:

          v9 = v50;
LABEL_50:

          goto LABEL_51;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMapsRecentConversationsIntentActionTypeFromString(v8));
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      v50 = v13;
    }
    else
    {
      v50 = 0;
    }
    v47 = a4;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("predictionTimestamp"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = (objc_class *)MEMORY[0x1E0C99D68];
        v18 = v16;
        v19 = [v17 alloc];
        objc_msgSend(v18, "doubleValue");
        v21 = v20;

        v22 = (id)objc_msgSend(v19, "initWithTimeIntervalSince1970:", v21);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v23 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
          objc_msgSend(v23, "dateFromString:", v16);
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_27;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v48 = 0;
            v12 = 0;
            goto LABEL_49;
          }
          v49 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v40 = *MEMORY[0x1E0D025B8];
          v57 = *MEMORY[0x1E0CB2D50];
          v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("predictionTimestamp"));
          v58 = v25;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = (id)objc_msgSend(v49, "initWithDomain:code:userInfo:", v40, 2, v24);
          v48 = 0;
          v12 = 0;
          *v47 = v41;
          goto LABEL_48;
        }
        v22 = v16;
      }
      v48 = v22;
    }
    else
    {
      v48 = 0;
    }
LABEL_27:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("predictionExpiration"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v25 = 0;
      goto LABEL_43;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = (objc_class *)MEMORY[0x1E0C99D68];
      v27 = v24;
      v28 = [v26 alloc];
      objc_msgSend(v27, "doubleValue");
      v30 = v29;

      v31 = (id)objc_msgSend(v28, "initWithTimeIntervalSince1970:", v30);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v32 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
        objc_msgSend(v32, "dateFromString:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_43;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v47)
        {
          v25 = 0;
          v12 = 0;
          goto LABEL_48;
        }
        v46 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v42 = *MEMORY[0x1E0D025B8];
        v55 = *MEMORY[0x1E0CB2D50];
        v36 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("predictionExpiration"));
        v56 = v36;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = (id)objc_msgSend(v46, "initWithDomain:code:userInfo:", v42, 2, v35);
        v25 = 0;
        v12 = 0;
        *v47 = v43;
        goto LABEL_47;
      }
      v31 = v24;
    }
    v25 = v31;
LABEL_43:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleID"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v47)
        {
          v45 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v44 = *MEMORY[0x1E0D025B8];
          v53 = *MEMORY[0x1E0CB2D50];
          v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("bundleID"));
          v54 = v38;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *v47 = (id)objc_msgSend(v45, "initWithDomain:code:userInfo:", v44, 2, v39);

        }
        v36 = 0;
        v12 = 0;
        goto LABEL_47;
      }
      v36 = v35;
    }
    else
    {
      v36 = 0;
    }
    v12 = -[BMMapsRecentConversationsIntent initWithContactInformation:actionType:predictionTimestamp:predictionExpiration:bundleID:](self, "initWithContactInformation:actionType:predictionTimestamp:predictionExpiration:bundleID:", v51, objc_msgSend(v50, "intValue"), v48, v25, v36);
    self = v12;
LABEL_47:

LABEL_48:
    goto LABEL_49;
  }
  if (a4)
  {
    v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v15 = *MEMORY[0x1E0D025B8];
    v61 = *MEMORY[0x1E0CB2D50];
    v51 = (BMMapsRecentConversationsIntentContactInformation *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("contactInformation"));
    v62[0] = v51;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, &v61, 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    *a4 = (id)objc_msgSend(v14, "initWithDomain:code:userInfo:", v15, 2, v9);
LABEL_51:

    goto LABEL_52;
  }
  v12 = 0;
LABEL_52:

  return v12;
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
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  _QWORD v29[6];

  v29[5] = *MEMORY[0x1E0C80C00];
  -[BMMapsRecentConversationsIntent contactInformation](self, "contactInformation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMapsRecentConversationsIntent actionType](self, "actionType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMapsRecentConversationsIntent predictionTimestamp](self, "predictionTimestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMapsRecentConversationsIntent predictionTimestamp](self, "predictionTimestamp");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSince1970");
    objc_msgSend(v7, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  -[BMMapsRecentConversationsIntent predictionExpiration](self, "predictionExpiration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMapsRecentConversationsIntent predictionExpiration](self, "predictionExpiration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSince1970");
    objc_msgSend(v11, "numberWithDouble:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  -[BMMapsRecentConversationsIntent bundleID](self, "bundleID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = CFSTR("contactInformation");
  v15 = (uint64_t)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v22 = v15;
  v29[0] = v15;
  v25 = CFSTR("actionType");
  v16 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v15, v24, v25);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[1] = v16;
  v26 = CFSTR("predictionTimestamp");
  v17 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[2] = v17;
  v27 = CFSTR("predictionExpiration");
  v18 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[3] = v18;
  v28 = CFSTR("bundleID");
  v19 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[4] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v24, 5, v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    if (v13)
      goto LABEL_19;
  }
  else
  {

    if (v13)
    {
LABEL_19:
      if (v9)
        goto LABEL_20;
      goto LABEL_25;
    }
  }

  if (v9)
  {
LABEL_20:
    if (v5)
      goto LABEL_21;
LABEL_26:

    if (v4)
      goto LABEL_22;
LABEL_27:

    goto LABEL_22;
  }
LABEL_25:

  if (!v5)
    goto LABEL_26;
LABEL_21:
  if (!v4)
    goto LABEL_27;
LABEL_22:

  return v20;
}

- (NSDate)predictionTimestamp
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_predictionTimestamp)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_predictionTimestamp);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "convertValue:toType:", v3, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
}

- (NSDate)predictionExpiration
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_predictionExpiration)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_predictionExpiration);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "convertValue:toType:", v3, 2);
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMMapsRecentConversationsIntent contactInformation](self, "contactInformation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contactInformation");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMMapsRecentConversationsIntent contactInformation](self, "contactInformation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contactInformation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_14;
    }
    v13 = -[BMMapsRecentConversationsIntent actionType](self, "actionType");
    if (v13 == objc_msgSend(v5, "actionType"))
    {
      -[BMMapsRecentConversationsIntent predictionTimestamp](self, "predictionTimestamp");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "predictionTimestamp");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

      }
      else
      {
        v16 = (void *)v15;
        -[BMMapsRecentConversationsIntent predictionTimestamp](self, "predictionTimestamp");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "predictionTimestamp");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "isEqual:", v18);

        if (!v19)
          goto LABEL_14;
      }
      -[BMMapsRecentConversationsIntent predictionExpiration](self, "predictionExpiration");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "predictionExpiration");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v20 == (void *)v21)
      {

      }
      else
      {
        v22 = (void *)v21;
        -[BMMapsRecentConversationsIntent predictionExpiration](self, "predictionExpiration");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "predictionExpiration");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "isEqual:", v24);

        if (!v25)
          goto LABEL_14;
      }
      -[BMMapsRecentConversationsIntent bundleID](self, "bundleID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27 == v28)
      {
        v12 = 1;
      }
      else
      {
        -[BMMapsRecentConversationsIntent bundleID](self, "bundleID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "bundleID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v29, "isEqual:", v30);

      }
      goto LABEL_15;
    }
LABEL_14:
    v12 = 0;
LABEL_15:

    goto LABEL_16;
  }
  v12 = 0;
LABEL_16:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BMMapsRecentConversationsIntentContactInformation)contactInformation
{
  return self->_contactInformation;
}

- (int)actionType
{
  return self->_actionType;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_contactInformation, 0);
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

    v4 = -[BMMapsRecentConversationsIntent initByReadFrom:]([BMMapsRecentConversationsIntent alloc], "initByReadFrom:", v7);
    v4[12] = 0;

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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("contactInformation_json"), 5, 1, &__block_literal_global_201);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("actionType"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("predictionTimestamp"), 3, 0, 3, 0, 2);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("predictionExpiration"), 3, 0, 4, 0, 2);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleID"), 2, 0, 5, 13, 0);
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
  return &unk_1E5F1FAF8;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("contactInformation"), 1, 14, objc_opt_class());
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("actionType"), 2, 4, 0, v2);
  v9[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("predictionTimestamp"), 3, 0, 0);
  v9[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("predictionExpiration"), 4, 0, 0);
  v9[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleID"), 5, 13, 0);
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __42__BMMapsRecentConversationsIntent_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contactInformation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
