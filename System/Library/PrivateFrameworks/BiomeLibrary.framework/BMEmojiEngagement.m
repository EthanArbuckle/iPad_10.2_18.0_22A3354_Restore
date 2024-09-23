@implementation BMEmojiEngagement

- (BMEmojiEngagement)initWithEmoji:(id)a3 wasPositiveEngagement:(id)a4 localeIdentifier:(id)a5 inputMode:(int)a6 replacementContext:(id)a7 resultPosition:(id)a8 numberSearchQueriesRun:(id)a9 finalSearchQuery:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  BMEmojiEngagement *v21;
  int v22;
  int v23;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v27 = a3;
  v17 = a4;
  v26 = a5;
  v25 = a7;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  v28.receiver = self;
  v28.super_class = (Class)BMEmojiEngagement;
  v21 = -[BMEventBase init](&v28, sel_init);
  if (v21)
  {
    v21->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v21->_emoji, a3);
    if (v17)
    {
      v21->_hasWasPositiveEngagement = 1;
      v21->_wasPositiveEngagement = objc_msgSend(v17, "BOOLValue");
    }
    else
    {
      v21->_hasWasPositiveEngagement = 0;
      v21->_wasPositiveEngagement = 0;
    }
    objc_storeStrong((id *)&v21->_localeIdentifier, a5);
    v21->_inputMode = a6;
    objc_storeStrong((id *)&v21->_replacementContext, a7);
    if (v18)
    {
      v21->_hasResultPosition = 1;
      v22 = objc_msgSend(v18, "intValue");
    }
    else
    {
      v21->_hasResultPosition = 0;
      v22 = -1;
    }
    v21->_resultPosition = v22;
    if (v19)
    {
      v21->_hasNumberSearchQueriesRun = 1;
      v23 = objc_msgSend(v19, "intValue");
    }
    else
    {
      v21->_hasNumberSearchQueriesRun = 0;
      v23 = -1;
    }
    v21->_numberSearchQueriesRun = v23;
    objc_storeStrong((id *)&v21->_finalSearchQuery, a10);
  }

  return v21;
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
  void *v12;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMEmojiEngagement emoji](self, "emoji");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMEmojiEngagement wasPositiveEngagement](self, "wasPositiveEngagement"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMEmojiEngagement localeIdentifier](self, "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BMEmojiEngagementInputModeAsString(-[BMEmojiEngagement inputMode](self, "inputMode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMEmojiEngagement replacementContext](self, "replacementContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMEmojiEngagement resultPosition](self, "resultPosition"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMEmojiEngagement numberSearchQueriesRun](self, "numberSearchQueriesRun"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMEmojiEngagement finalSearchQuery](self, "finalSearchQuery");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMEmojiEngagement with emoji: %@, wasPositiveEngagement: %@, localeIdentifier: %@, inputMode: %@, replacementContext: %@, resultPosition: %@, numberSearchQueriesRun: %@, finalSearchQuery: %@"), v4, v5, v6, v7, v8, v9, v10, v11);

  return (NSString *)v12;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMEmojiEngagement *v5;
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
  uint64_t v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  char v39;
  unsigned int v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  void *v44;
  uint64_t v45;
  BMEmojiEngagement *v46;
  objc_super v48;

  v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)BMEmojiEngagement;
  v5 = -[BMEventBase init](&v48, sel_init);
  if (!v5)
    goto LABEL_77;
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
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 40;
          goto LABEL_54;
        case 2u:
          v21 = 0;
          v22 = 0;
          v23 = 0;
          v5->_hasWasPositiveEngagement = 1;
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
                  goto LABEL_58;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v23 = 0;
LABEL_58:
          v5->_wasPositiveEngagement = v23 != 0;
          continue;
        case 3u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 48;
          goto LABEL_54;
        case 4u:
          v27 = 0;
          v28 = 0;
          v29 = 0;
          while (2)
          {
            v30 = *v6;
            v31 = *(_QWORD *)&v4[v30];
            if (v31 == -1 || v31 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v32 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v31);
              *(_QWORD *)&v4[v30] = v31 + 1;
              v29 |= (unint64_t)(v32 & 0x7F) << v27;
              if (v32 < 0)
              {
                v27 += 7;
                v16 = v28++ >= 9;
                if (v16)
                {
                  LODWORD(v29) = 0;
                  goto LABEL_62;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v29) = 0;
LABEL_62:
          if (v29 >= 0xB)
            LODWORD(v29) = 0;
          v5->_inputMode = v29;
          continue;
        case 5u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 56;
          goto LABEL_54;
        case 6u:
          v33 = 0;
          v34 = 0;
          v35 = 0;
          v5->_hasResultPosition = 1;
          while (2)
          {
            v36 = *v6;
            v37 = *(_QWORD *)&v4[v36];
            if (v37 == -1 || v37 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v38 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v37);
              *(_QWORD *)&v4[v36] = v37 + 1;
              v35 |= (unint64_t)(v38 & 0x7F) << v33;
              if (v38 < 0)
              {
                v33 += 7;
                v16 = v34++ >= 9;
                if (v16)
                {
                  LODWORD(v35) = 0;
                  goto LABEL_68;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v35) = 0;
LABEL_68:
          v45 = 28;
          goto LABEL_73;
        case 7u:
          v39 = 0;
          v40 = 0;
          v35 = 0;
          v5->_hasNumberSearchQueriesRun = 1;
          break;
        case 8u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 64;
LABEL_54:
          v44 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_76;
          continue;
      }
      while (1)
      {
        v41 = *v6;
        v42 = *(_QWORD *)&v4[v41];
        if (v42 == -1 || v42 >= *(_QWORD *)&v4[*v7])
          break;
        v43 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v42);
        *(_QWORD *)&v4[v41] = v42 + 1;
        v35 |= (unint64_t)(v43 & 0x7F) << v39;
        if ((v43 & 0x80) == 0)
          goto LABEL_70;
        v39 += 7;
        v16 = v40++ >= 9;
        if (v16)
        {
          LODWORD(v35) = 0;
          goto LABEL_72;
        }
      }
      v4[*v8] = 1;
LABEL_70:
      if (v4[*v8])
        LODWORD(v35) = 0;
LABEL_72:
      v45 = 32;
LABEL_73:
      *(_DWORD *)((char *)&v5->super.super.isa + v45) = v35;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_76:
    v46 = 0;
  else
LABEL_77:
    v46 = v5;

  return v46;
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (self->_emoji)
    PBDataWriterWriteStringField();
  if (self->_hasWasPositiveEngagement)
    PBDataWriterWriteBOOLField();
  if (self->_localeIdentifier)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  if (self->_replacementContext)
    PBDataWriterWriteStringField();
  if (self->_hasResultPosition)
    PBDataWriterWriteInt32Field();
  v4 = v5;
  if (self->_hasNumberSearchQueriesRun)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_finalSearchQuery)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMEmojiEngagement writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMEmojiEngagement)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BMEmojiEngagement *v19;
  id *v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  BMEmojiEngagement *v33;
  id v34;
  void *v35;
  id v36;
  id v38;
  id v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  void *v45;
  id v46;
  id v47;
  uint64_t v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  BMEmojiEngagement *v57;
  BMEmojiEngagement *v58;
  id v59;
  void *v60;
  id v61;
  void *v62;
  id v63;
  void *v64;
  id *v65;
  id v66;
  id v67;
  id v68;
  id v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  id v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  id v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  _QWORD v86[3];

  v86[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("emoji"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("wasPositiveEngagement"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = a4;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v10 = 0;
          v19 = 0;
          goto LABEL_51;
        }
        v57 = self;
        v20 = a4;
        v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v22 = *MEMORY[0x1E0D025B8];
        v83 = *MEMORY[0x1E0CB2D50];
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("wasPositiveEngagement"));
        v84 = v23;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = v21;
        v11 = (void *)v24;
        v26 = (id)objc_msgSend(v25, "initWithDomain:code:userInfo:", v22, 2, v24);
        v10 = 0;
        v19 = 0;
        *v20 = v26;
        goto LABEL_75;
      }
      v10 = v9;
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("localeIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v9;
    if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v68 = 0;
LABEL_10:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("inputMode"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v11;
      if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = v12;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v58 = self;
            if (!v65)
            {
              v70 = 0;
              v19 = 0;
              goto LABEL_48;
            }
            v52 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v53 = v10;
            v54 = *MEMORY[0x1E0D025B8];
            v79 = *MEMORY[0x1E0CB2D50];
            v66 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("inputMode"));
            v80 = v66;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = v54;
            v10 = v53;
            v70 = 0;
            v19 = 0;
            *v65 = (id)objc_msgSend(v52, "initWithDomain:code:userInfo:", v55, 2, v30);
            v11 = v62;
            goto LABEL_77;
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMEmojiEngagementInputModeFromString(v12));
          v13 = (id)objc_claimAutoreleasedReturnValue();
        }
        v70 = v13;
      }
      else
      {
        v70 = 0;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("replacementContext"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = v8;
      if (!v30 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v66 = 0;
LABEL_33:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("resultPosition"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = v7;
        v61 = v10;
        if (v31 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!v65)
            {
              v63 = 0;
              v19 = 0;
              goto LABEL_45;
            }
            v33 = self;
            v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v44 = *MEMORY[0x1E0D025B8];
            v75 = *MEMORY[0x1E0CB2D50];
            v34 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("resultPosition"));
            v76 = v34;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = v43;
            v7 = v60;
            v46 = (id)objc_msgSend(v45, "initWithDomain:code:userInfo:", v44, 2, v32);
            v19 = 0;
            v63 = 0;
            *v65 = v46;
LABEL_44:

            self = v33;
            v8 = v67;
            v10 = v61;
LABEL_45:
            v11 = v62;
LABEL_46:

LABEL_47:
LABEL_48:
            v23 = v68;
            goto LABEL_49;
          }
          v63 = v31;
        }
        else
        {
          v63 = 0;
        }
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("numberSearchQueriesRun"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (v32 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          v33 = self;
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!v65)
            {
              v34 = 0;
              v19 = 0;
              goto LABEL_44;
            }
            v47 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v48 = *MEMORY[0x1E0D025B8];
            v73 = *MEMORY[0x1E0CB2D50];
            v36 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("numberSearchQueriesRun"));
            v74 = v36;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = (id)objc_msgSend(v47, "initWithDomain:code:userInfo:", v48, 2, v35);
            v19 = 0;
            v34 = 0;
            *v65 = v49;
            goto LABEL_43;
          }
          v34 = v32;
        }
        else
        {
          v33 = self;
          v34 = 0;
        }
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("finalSearchQuery"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (v35 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (v65)
            {
              v59 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v56 = *MEMORY[0x1E0D025B8];
              v71 = *MEMORY[0x1E0CB2D50];
              v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("finalSearchQuery"));
              v72 = v50;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              *v65 = (id)objc_msgSend(v59, "initWithDomain:code:userInfo:", v56, 2, v51);

            }
            v36 = 0;
            v19 = 0;
            goto LABEL_43;
          }
          v36 = v35;
        }
        else
        {
          v36 = 0;
        }
        v19 = -[BMEmojiEngagement initWithEmoji:wasPositiveEngagement:localeIdentifier:inputMode:replacementContext:resultPosition:numberSearchQueriesRun:finalSearchQuery:](v33, "initWithEmoji:wasPositiveEngagement:localeIdentifier:inputMode:replacementContext:resultPosition:numberSearchQueriesRun:finalSearchQuery:", v67, v61, v68, objc_msgSend(v70, "intValue"), v66, v63, v34, v36);
        v33 = v19;
LABEL_43:

        v7 = v60;
        goto LABEL_44;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v66 = v30;
        goto LABEL_33;
      }
      v58 = self;
      if (v65)
      {
        v38 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v39 = v10;
        v40 = *MEMORY[0x1E0D025B8];
        v77 = *MEMORY[0x1E0CB2D50];
        v63 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("replacementContext"));
        v78 = v63;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v38;
        v11 = v62;
        v42 = v40;
        v10 = v39;
        v19 = 0;
        v66 = 0;
        *v65 = (id)objc_msgSend(v41, "initWithDomain:code:userInfo:", v42, 2, v31);
        goto LABEL_46;
      }
      v66 = 0;
      v19 = 0;
LABEL_77:
      self = v58;
      goto LABEL_47;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v68 = v11;
      goto LABEL_10;
    }
    v57 = self;
    if (v65)
    {
      v69 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v27 = v10;
      v28 = *MEMORY[0x1E0D025B8];
      v81 = *MEMORY[0x1E0CB2D50];
      v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("localeIdentifier"));
      v82 = v70;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      v10 = v27;
      v23 = 0;
      v19 = 0;
      *v65 = (id)objc_msgSend(v69, "initWithDomain:code:userInfo:", v29, 2, v12);
LABEL_49:

      v9 = v64;
LABEL_50:

      goto LABEL_51;
    }
    v23 = 0;
    v19 = 0;
LABEL_75:
    self = v57;
    goto LABEL_50;
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
    v19 = 0;
    goto LABEL_52;
  }
  v14 = a4;
  v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v16 = *MEMORY[0x1E0D025B8];
  v85 = *MEMORY[0x1E0CB2D50];
  v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("emoji"));
  v86[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v86, &v85, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v16;
  v10 = (id)v17;
  v8 = 0;
  v19 = 0;
  *v14 = (id)objc_msgSend(v15, "initWithDomain:code:userInfo:", v18, 2, v9);
LABEL_51:

LABEL_52:
  return v19;
}

- (id)jsonDictionary
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[8];
  _QWORD v28[10];

  v28[8] = *MEMORY[0x1E0C80C00];
  -[BMEmojiEngagement emoji](self, "emoji");
  v3 = objc_claimAutoreleasedReturnValue();
  if (-[BMEmojiEngagement hasWasPositiveEngagement](self, "hasWasPositiveEngagement"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMEmojiEngagement wasPositiveEngagement](self, "wasPositiveEngagement"));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  -[BMEmojiEngagement localeIdentifier](self, "localeIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMEmojiEngagement inputMode](self, "inputMode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMEmojiEngagement replacementContext](self, "replacementContext");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMEmojiEngagement hasResultPosition](self, "hasResultPosition"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMEmojiEngagement resultPosition](self, "resultPosition"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = 0;
  }
  if (-[BMEmojiEngagement hasNumberSearchQueriesRun](self, "hasNumberSearchQueriesRun"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMEmojiEngagement numberSearchQueriesRun](self, "numberSearchQueriesRun"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  -[BMEmojiEngagement finalSearchQuery](self, "finalSearchQuery");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = CFSTR("emoji");
  v9 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v9;
  v28[0] = v9;
  v27[1] = CFSTR("wasPositiveEngagement");
  v10 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v10;
  v28[1] = v10;
  v27[2] = CFSTR("localeIdentifier");
  v11 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v3;
  v20 = (void *)v11;
  v28[2] = v11;
  v27[3] = CFSTR("inputMode");
  v12 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v4;
  v28[3] = v12;
  v27[4] = CFSTR("replacementContext");
  v13 = v26;
  if (!v26)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v5;
  v28[4] = v13;
  v27[5] = CFSTR("resultPosition");
  v15 = v25;
  if (!v25)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[5] = v15;
  v27[6] = CFSTR("numberSearchQueriesRun");
  v16 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[6] = v16;
  v27[7] = CFSTR("finalSearchQuery");
  v17 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[7] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v7)
      goto LABEL_28;
  }
  else
  {

    if (v7)
      goto LABEL_28;
  }

LABEL_28:
  if (!v25)

  if (!v26)
  if (!v6)

  if (v14)
  {
    if (v23)
      goto LABEL_36;
LABEL_41:

    if (v24)
      goto LABEL_37;
LABEL_42:

    goto LABEL_37;
  }

  if (!v23)
    goto LABEL_41;
LABEL_36:
  if (!v24)
    goto LABEL_42;
LABEL_37:

  return v18;
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
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  int v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMEmojiEngagement emoji](self, "emoji");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "emoji");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMEmojiEngagement emoji](self, "emoji");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "emoji");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_33;
    }
    if (-[BMEmojiEngagement hasWasPositiveEngagement](self, "hasWasPositiveEngagement")
      || objc_msgSend(v5, "hasWasPositiveEngagement"))
    {
      if (!-[BMEmojiEngagement hasWasPositiveEngagement](self, "hasWasPositiveEngagement"))
        goto LABEL_33;
      if (!objc_msgSend(v5, "hasWasPositiveEngagement"))
        goto LABEL_33;
      v13 = -[BMEmojiEngagement wasPositiveEngagement](self, "wasPositiveEngagement");
      if (v13 != objc_msgSend(v5, "wasPositiveEngagement"))
        goto LABEL_33;
    }
    -[BMEmojiEngagement localeIdentifier](self, "localeIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localeIdentifier");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v14 == (void *)v15)
    {

    }
    else
    {
      v16 = (void *)v15;
      -[BMEmojiEngagement localeIdentifier](self, "localeIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localeIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqual:", v18);

      if (!v19)
        goto LABEL_33;
    }
    v20 = -[BMEmojiEngagement inputMode](self, "inputMode");
    if (v20 == objc_msgSend(v5, "inputMode"))
    {
      -[BMEmojiEngagement replacementContext](self, "replacementContext");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "replacementContext");
      v22 = objc_claimAutoreleasedReturnValue();
      if (v21 == (void *)v22)
      {

      }
      else
      {
        v23 = (void *)v22;
        -[BMEmojiEngagement replacementContext](self, "replacementContext");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "replacementContext");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v24, "isEqual:", v25);

        if (!v26)
          goto LABEL_33;
      }
      if (!-[BMEmojiEngagement hasResultPosition](self, "hasResultPosition")
        && !objc_msgSend(v5, "hasResultPosition")
        || -[BMEmojiEngagement hasResultPosition](self, "hasResultPosition")
        && objc_msgSend(v5, "hasResultPosition")
        && (v27 = -[BMEmojiEngagement resultPosition](self, "resultPosition"),
            v27 == objc_msgSend(v5, "resultPosition")))
      {
        if (!-[BMEmojiEngagement hasNumberSearchQueriesRun](self, "hasNumberSearchQueriesRun")
          && !objc_msgSend(v5, "hasNumberSearchQueriesRun")
          || -[BMEmojiEngagement hasNumberSearchQueriesRun](self, "hasNumberSearchQueriesRun")
          && objc_msgSend(v5, "hasNumberSearchQueriesRun")
          && (v28 = -[BMEmojiEngagement numberSearchQueriesRun](self, "numberSearchQueriesRun"),
              v28 == objc_msgSend(v5, "numberSearchQueriesRun")))
        {
          -[BMEmojiEngagement finalSearchQuery](self, "finalSearchQuery");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "finalSearchQuery");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29 == v30)
          {
            v12 = 1;
          }
          else
          {
            -[BMEmojiEngagement finalSearchQuery](self, "finalSearchQuery");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "finalSearchQuery");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v31, "isEqual:", v32);

          }
          goto LABEL_34;
        }
      }
    }
LABEL_33:
    v12 = 0;
LABEL_34:

    goto LABEL_35;
  }
  v12 = 0;
LABEL_35:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)emoji
{
  return self->_emoji;
}

- (BOOL)wasPositiveEngagement
{
  return self->_wasPositiveEngagement;
}

- (BOOL)hasWasPositiveEngagement
{
  return self->_hasWasPositiveEngagement;
}

- (void)setHasWasPositiveEngagement:(BOOL)a3
{
  self->_hasWasPositiveEngagement = a3;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (int)inputMode
{
  return self->_inputMode;
}

- (NSString)replacementContext
{
  return self->_replacementContext;
}

- (int)resultPosition
{
  return self->_resultPosition;
}

- (BOOL)hasResultPosition
{
  return self->_hasResultPosition;
}

- (void)setHasResultPosition:(BOOL)a3
{
  self->_hasResultPosition = a3;
}

- (int)numberSearchQueriesRun
{
  return self->_numberSearchQueriesRun;
}

- (BOOL)hasNumberSearchQueriesRun
{
  return self->_hasNumberSearchQueriesRun;
}

- (void)setHasNumberSearchQueriesRun:(BOOL)a3
{
  self->_hasNumberSearchQueriesRun = a3;
}

- (NSString)finalSearchQuery
{
  return self->_finalSearchQuery;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalSearchQuery, 0);
  objc_storeStrong((id *)&self->_replacementContext, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_emoji, 0);
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

    v4 = -[BMEmojiEngagement initByReadFrom:]([BMEmojiEngagement alloc], "initByReadFrom:", v7);
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
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[9];

  v12[8] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("emoji"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("wasPositiveEngagement"), 0, 0, 2, 12, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("localeIdentifier"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("inputMode"), 0, 0, 4, 4, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("replacementContext"), 2, 0, 5, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("resultPosition"), 0, 0, 6, 2, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("numberSearchQueriesRun"), 0, 0, 7, 2, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("finalSearchQuery"), 2, 0, 8, 13, 0);
  v12[0] = v2;
  v12[1] = v3;
  v12[2] = v4;
  v12[3] = v5;
  v12[4] = v6;
  v12[5] = v7;
  v12[6] = v8;
  v12[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1DED8;
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
  void *v10;
  _QWORD v12[9];

  v12[8] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("emoji"), 1, 13, 0);
  v12[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("wasPositiveEngagement"), 2, 12, 0);
  v12[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("localeIdentifier"), 3, 13, 0);
  v12[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("inputMode"), 4, 4, 0);
  v12[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("replacementContext"), 5, 13, 0);
  v12[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("resultPosition"), 6, 2, 0);
  v12[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("numberSearchQueriesRun"), 7, 2, 0);
  v12[6] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("finalSearchQuery"), 8, 13, 0);
  v12[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
