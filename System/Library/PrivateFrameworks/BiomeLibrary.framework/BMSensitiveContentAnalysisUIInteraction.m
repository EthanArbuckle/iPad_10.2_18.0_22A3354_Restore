@implementation BMSensitiveContentAnalysisUIInteraction

- (BMSensitiveContentAnalysisUIInteraction)initWithInteractionType:(int)a3 ageGroup:(int)a4 eventDirection:(int)a5 screen:(int)a6 action:(int)a7 contentType:(int)a8 clientBundleID:(id)a9 trackingVersion:(id)a10
{
  id v16;
  id v17;
  BMSensitiveContentAnalysisUIInteraction *v18;
  objc_super v21;

  v16 = a9;
  v17 = a10;
  v21.receiver = self;
  v21.super_class = (Class)BMSensitiveContentAnalysisUIInteraction;
  v18 = -[BMEventBase init](&v21, sel_init);
  if (v18)
  {
    v18->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    v18->_interactionType = a3;
    v18->_ageGroup = a4;
    v18->_eventDirection = a5;
    v18->_screen = a6;
    v18->_action = a7;
    v18->_contentType = a8;
    objc_storeStrong((id *)&v18->_clientBundleID, a9);
    objc_storeStrong((id *)&v18->_trackingVersion, a10);
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
  void *v11;
  void *v12;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  BMSensitiveContentAnalysisUIInteractionInteractionTypeAsString(-[BMSensitiveContentAnalysisUIInteraction interactionType](self, "interactionType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMSensitiveContentAnalysisUIInteractionAgeGroupAsString(-[BMSensitiveContentAnalysisUIInteraction ageGroup](self, "ageGroup"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BMSensitiveContentAnalysisUIInteractionEventDirectionAsString(-[BMSensitiveContentAnalysisUIInteraction eventDirection](self, "eventDirection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BMSensitiveContentAnalysisUIInteractionScreenAsString(-[BMSensitiveContentAnalysisUIInteraction screen](self, "screen"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BMSensitiveContentAnalysisUIInteractionActionAsString(-[BMSensitiveContentAnalysisUIInteraction action](self, "action"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  BMSensitiveContentAnalysisUIInteractionContentTypeAsString(-[BMSensitiveContentAnalysisUIInteraction contentType](self, "contentType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSensitiveContentAnalysisUIInteraction clientBundleID](self, "clientBundleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSensitiveContentAnalysisUIInteraction trackingVersion](self, "trackingVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSensitiveContentAnalysisUIInteraction with interactionType: %@, ageGroup: %@, eventDirection: %@, screen: %@, action: %@, contentType: %@, clientBundleID: %@, trackingVersion: %@"), v4, v5, v6, v7, v8, v9, v10, v11);

  return (NSString *)v12;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSensitiveContentAnalysisUIInteraction *v5;
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
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  char v40;
  unsigned int v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  char v45;
  unsigned int v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  BMSensitiveContentAnalysisUIInteraction *v54;
  objc_super v56;

  v4 = a3;
  v56.receiver = self;
  v56.super_class = (Class)BMSensitiveContentAnalysisUIInteraction;
  v5 = -[BMEventBase init](&v56, sel_init);
  if (!v5)
    goto LABEL_107;
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
          v19 = 0;
          v20 = 0;
          v21 = 0;
          while (1)
          {
            v22 = *v6;
            v23 = *(_QWORD *)&v4[v22];
            if (v23 == -1 || v23 >= *(_QWORD *)&v4[*v7])
              break;
            v24 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v23);
            *(_QWORD *)&v4[v22] = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if ((v24 & 0x80) == 0)
              goto LABEL_68;
            v19 += 7;
            v16 = v20++ >= 9;
            if (v16)
            {
              LODWORD(v21) = 0;
              goto LABEL_70;
            }
          }
          v4[*v8] = 1;
LABEL_68:
          if (v4[*v8])
            LODWORD(v21) = 0;
LABEL_70:
          if (v21 >= 4)
            LODWORD(v21) = 0;
          v53 = 20;
          goto LABEL_103;
        case 2u:
          v25 = 0;
          v26 = 0;
          v21 = 0;
          while (2)
          {
            v27 = *v6;
            v28 = *(_QWORD *)&v4[v27];
            if (v28 == -1 || v28 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v29 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v28);
              *(_QWORD *)&v4[v27] = v28 + 1;
              v21 |= (unint64_t)(v29 & 0x7F) << v25;
              if (v29 < 0)
              {
                v25 += 7;
                v16 = v26++ >= 9;
                if (v16)
                {
                  LODWORD(v21) = 0;
                  goto LABEL_76;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v21) = 0;
LABEL_76:
          if (v21 >= 4)
            LODWORD(v21) = 0;
          v53 = 24;
          goto LABEL_103;
        case 3u:
          v30 = 0;
          v31 = 0;
          v21 = 0;
          while (2)
          {
            v32 = *v6;
            v33 = *(_QWORD *)&v4[v32];
            if (v33 == -1 || v33 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v34 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v33);
              *(_QWORD *)&v4[v32] = v33 + 1;
              v21 |= (unint64_t)(v34 & 0x7F) << v30;
              if (v34 < 0)
              {
                v30 += 7;
                v16 = v31++ >= 9;
                if (v16)
                {
                  LODWORD(v21) = 0;
                  goto LABEL_82;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v21) = 0;
LABEL_82:
          if (v21 >= 4)
            LODWORD(v21) = 0;
          v53 = 28;
          goto LABEL_103;
        case 4u:
          v35 = 0;
          v36 = 0;
          v21 = 0;
          while (2)
          {
            v37 = *v6;
            v38 = *(_QWORD *)&v4[v37];
            if (v38 == -1 || v38 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v39 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v38);
              *(_QWORD *)&v4[v37] = v38 + 1;
              v21 |= (unint64_t)(v39 & 0x7F) << v35;
              if (v39 < 0)
              {
                v35 += 7;
                v16 = v36++ >= 9;
                if (v16)
                {
                  LODWORD(v21) = 0;
                  goto LABEL_88;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v21) = 0;
LABEL_88:
          if (v21 >= 3)
            LODWORD(v21) = 0;
          v53 = 32;
          goto LABEL_103;
        case 5u:
          v40 = 0;
          v41 = 0;
          v21 = 0;
          while (2)
          {
            v42 = *v6;
            v43 = *(_QWORD *)&v4[v42];
            if (v43 == -1 || v43 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v44 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v43);
              *(_QWORD *)&v4[v42] = v43 + 1;
              v21 |= (unint64_t)(v44 & 0x7F) << v40;
              if (v44 < 0)
              {
                v40 += 7;
                v16 = v41++ >= 9;
                if (v16)
                {
                  LODWORD(v21) = 0;
                  goto LABEL_94;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v21) = 0;
LABEL_94:
          if (v21 >= 0xA)
            LODWORD(v21) = 0;
          v53 = 36;
          goto LABEL_103;
        case 6u:
          v45 = 0;
          v46 = 0;
          v21 = 0;
          break;
        case 7u:
          PBReaderReadString();
          v50 = objc_claimAutoreleasedReturnValue();
          v51 = 48;
          goto LABEL_66;
        case 8u:
          PBReaderReadString();
          v50 = objc_claimAutoreleasedReturnValue();
          v51 = 56;
LABEL_66:
          v52 = *(Class *)((char *)&v5->super.super.isa + v51);
          *(Class *)((char *)&v5->super.super.isa + v51) = (Class)v50;

          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_106;
          continue;
      }
      while (1)
      {
        v47 = *v6;
        v48 = *(_QWORD *)&v4[v47];
        if (v48 == -1 || v48 >= *(_QWORD *)&v4[*v7])
          break;
        v49 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v48);
        *(_QWORD *)&v4[v47] = v48 + 1;
        v21 |= (unint64_t)(v49 & 0x7F) << v45;
        if ((v49 & 0x80) == 0)
          goto LABEL_98;
        v45 += 7;
        v16 = v46++ >= 9;
        if (v16)
        {
          LODWORD(v21) = 0;
          goto LABEL_100;
        }
      }
      v4[*v8] = 1;
LABEL_98:
      if (v4[*v8])
        LODWORD(v21) = 0;
LABEL_100:
      if (v21 >= 3)
        LODWORD(v21) = 0;
      v53 = 40;
LABEL_103:
      *(_DWORD *)((char *)&v5->super.super.isa + v53) = v21;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_106:
    v54 = 0;
  else
LABEL_107:
    v54 = v5;

  return v54;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_clientBundleID)
    PBDataWriterWriteStringField();
  if (self->_trackingVersion)
    PBDataWriterWriteStringField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSensitiveContentAnalysisUIInteraction writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSensitiveContentAnalysisUIInteraction)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id *v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id *v21;
  void *v22;
  BMSensitiveContentAnalysisUIInteraction *v23;
  id v24;
  id v25;
  id *v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v35;
  uint64_t v36;
  id v37;
  id *v38;
  id v39;
  uint64_t v40;
  id v41;
  id *v42;
  uint64_t v43;
  id v44;
  id *v45;
  id v46;
  uint64_t v47;
  id *v48;
  id v49;
  uint64_t v50;
  id v51;
  id *v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  _QWORD *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  id v65;
  id v66;
  void *v67;
  void *v68;
  id v69;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  id v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  id v79;
  uint64_t v80;
  id v81;
  uint64_t v82;
  _QWORD *v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  _QWORD v87[3];

  v87[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("interactionType"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v71 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = 0;
LABEL_9:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ageGroup"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = v8;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v67 = 0;
            goto LABEL_70;
          }
          v39 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v40 = *MEMORY[0x1E0D025B8];
          v84 = *MEMORY[0x1E0CB2D50];
          v68 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("ageGroup"));
          v85 = v68;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = (id)objc_msgSend(v39, "initWithDomain:code:userInfo:", v40, 2, v10);
          v67 = 0;
          v42 = a4;
          a4 = 0;
          *v42 = v41;
          goto LABEL_69;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSensitiveContentAnalysisUIInteractionAgeGroupFromString(v8));
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      v67 = v9;
    }
    else
    {
      v67 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("eventDirection"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v10;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v6;
        v12 = v10;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v68 = 0;
            goto LABEL_69;
          }
          v69 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v43 = *MEMORY[0x1E0D025B8];
          v82 = *MEMORY[0x1E0CB2D50];
          v15 = (_QWORD *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("eventDirection"));
          v83 = v15;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = (id)objc_msgSend(v69, "initWithDomain:code:userInfo:", v43, 2, v33);
          v68 = 0;
          v45 = a4;
          a4 = 0;
          *v45 = v44;
LABEL_68:

LABEL_69:
          goto LABEL_70;
        }
        v11 = v6;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSensitiveContentAnalysisUIInteractionEventDirectionFromString(v10));
        v12 = (id)objc_claimAutoreleasedReturnValue();
      }
      v68 = v12;
    }
    else
    {
      v11 = v6;
      v68 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("screen"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      v14 = a4;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = v13;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v15 = a4;
          if (!a4)
          {
            a4 = 0;
            v33 = v13;
            v6 = v11;
            goto LABEL_68;
          }
          v46 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v47 = *MEMORY[0x1E0D025B8];
          v80 = *MEMORY[0x1E0CB2D50];
          v66 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("screen"));
          v81 = v66;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          a4 = 0;
          *v15 = (id)objc_msgSend(v46, "initWithDomain:code:userInfo:", v47, 2);
          v15 = 0;
          v33 = v13;
          v10 = v64;
          v6 = v11;
          goto LABEL_67;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSensitiveContentAnalysisUIInteractionScreenFromString(v13));
        v15 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v14 = a4;
      v15 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("action"));
    v16 = objc_claimAutoreleasedReturnValue();
    v60 = v15;
    v61 = v13;
    v62 = (void *)v16;
    if (v16 && (v17 = (void *)v16, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      v6 = v11;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v14)
          {
            v66 = 0;
            a4 = 0;
            v33 = v61;
            goto LABEL_67;
          }
          v48 = v14;
          v49 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v50 = *MEMORY[0x1E0D025B8];
          v78 = *MEMORY[0x1E0CB2D50];
          v65 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("action"));
          v79 = v65;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = 0;
          a4 = 0;
          *v48 = (id)objc_msgSend(v49, "initWithDomain:code:userInfo:", v50, 2, v18);
          goto LABEL_92;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSensitiveContentAnalysisUIInteractionActionFromString(v17));
        v66 = (id)objc_claimAutoreleasedReturnValue();
        a4 = v14;
LABEL_32:
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("contentType"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v65 = 0;
          goto LABEL_35;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v65 = v18;
          goto LABEL_35;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSensitiveContentAnalysisUIInteractionContentTypeFromString(v18));
          v65 = (id)objc_claimAutoreleasedReturnValue();
LABEL_35:
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("clientBundleID"));
          v19 = objc_claimAutoreleasedReturnValue();
          v58 = (void *)v19;
          v59 = v8;
          if (!v19 || (v20 = (void *)v19, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v21 = a4;
            v63 = 0;
            goto LABEL_38;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v21 = a4;
            v63 = v20;
LABEL_38:
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("trackingVersion"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v22 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v56 = v18;
              v57 = v5;
              v23 = self;
              v24 = 0;
LABEL_41:
              v15 = v60;
              a4 = -[BMSensitiveContentAnalysisUIInteraction initWithInteractionType:ageGroup:eventDirection:screen:action:contentType:clientBundleID:trackingVersion:](v23, "initWithInteractionType:ageGroup:eventDirection:screen:action:contentType:clientBundleID:trackingVersion:", objc_msgSend(v6, "intValue"), objc_msgSend(v67, "intValue"), objc_msgSend(v68, "intValue"), objc_msgSend(v60, "intValue"), objc_msgSend(v66, "intValue"), objc_msgSend(v65, "intValue"), v63, v24);
              self = (BMSensitiveContentAnalysisUIInteraction *)a4;
              v18 = v56;
              v5 = v57;
LABEL_64:

              v20 = v58;
              v8 = v59;
              v10 = v64;
              v33 = v61;
LABEL_65:

LABEL_66:
LABEL_67:

              goto LABEL_68;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v56 = v18;
              v57 = v5;
              v23 = self;
              v24 = v22;
              goto LABEL_41;
            }
            if (v21)
            {
              v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v30 = *MEMORY[0x1E0D025B8];
              v72 = *MEMORY[0x1E0CB2D50];
              v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("trackingVersion"));
              v73 = v31;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              *v21 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v30, 2, v32);

            }
            v24 = 0;
            a4 = 0;
LABEL_63:
            v15 = v60;
            goto LABEL_64;
          }
          if (a4)
          {
            v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v26 = a4;
            v27 = *MEMORY[0x1E0D025B8];
            v74 = *MEMORY[0x1E0CB2D50];
            v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("clientBundleID"));
            v75 = v24;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = (id)objc_msgSend(v25, "initWithDomain:code:userInfo:", v27, 2, v22);
            a4 = 0;
            v63 = 0;
            *v26 = v28;
            goto LABEL_63;
          }
          v63 = 0;
LABEL_85:
          v15 = v60;
          v33 = v61;
          goto LABEL_65;
        }
        if (a4)
        {
          v51 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v52 = a4;
          v53 = *MEMORY[0x1E0D025B8];
          v76 = *MEMORY[0x1E0CB2D50];
          v63 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("contentType"));
          v77 = v63;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
          v54 = objc_claimAutoreleasedReturnValue();
          v55 = (id)objc_msgSend(v51, "initWithDomain:code:userInfo:", v53, 2, v54);
          v65 = 0;
          a4 = 0;
          *v52 = v55;
          v20 = (void *)v54;
          goto LABEL_85;
        }
        v65 = 0;
LABEL_92:
        v15 = v60;
        v33 = v61;
        goto LABEL_66;
      }
      v66 = v17;
    }
    else
    {
      v66 = 0;
      v6 = v11;
    }
    a4 = v14;
    goto LABEL_32;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v71;
LABEL_8:
    v6 = v7;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSensitiveContentAnalysisUIInteractionInteractionTypeFromString(v71));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!a4)
  {
    v6 = 0;
    goto LABEL_71;
  }
  v35 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v36 = *MEMORY[0x1E0D025B8];
  v86 = *MEMORY[0x1E0CB2D50];
  v67 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("interactionType"));
  v87[0] = v67;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v87, &v86, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (id)objc_msgSend(v35, "initWithDomain:code:userInfo:", v36, 2, v8);
  v6 = 0;
  v38 = a4;
  a4 = 0;
  *v38 = v37;
LABEL_70:

LABEL_71:
  return (BMSensitiveContentAnalysisUIInteraction *)a4;
}

- (id)jsonDictionary
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[8];
  _QWORD v28[10];

  v28[8] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSensitiveContentAnalysisUIInteraction interactionType](self, "interactionType"));
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSensitiveContentAnalysisUIInteraction ageGroup](self, "ageGroup"));
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSensitiveContentAnalysisUIInteraction eventDirection](self, "eventDirection"));
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSensitiveContentAnalysisUIInteraction screen](self, "screen"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSensitiveContentAnalysisUIInteraction action](self, "action"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSensitiveContentAnalysisUIInteraction contentType](self, "contentType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSensitiveContentAnalysisUIInteraction clientBundleID](self, "clientBundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSensitiveContentAnalysisUIInteraction trackingVersion](self, "trackingVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = CFSTR("interactionType");
  v11 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v11;
  v28[0] = v11;
  v27[1] = CFSTR("ageGroup");
  v12 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v12;
  v28[1] = v12;
  v27[2] = CFSTR("eventDirection");
  v13 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v3;
  v20 = (void *)v13;
  v28[2] = v13;
  v27[3] = CFSTR("screen");
  v14 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v4;
  v28[3] = v14;
  v27[4] = CFSTR("action");
  v15 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v5;
  v28[4] = v15;
  v27[5] = CFSTR("contentType");
  v16 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[5] = v16;
  v27[6] = CFSTR("clientBundleID");
  v17 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[6] = v17;
  v27[7] = CFSTR("trackingVersion");
  v18 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[7] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 8);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (v9)
      goto LABEL_19;
LABEL_29:

    if (v8)
      goto LABEL_20;
    goto LABEL_30;
  }

  if (!v9)
    goto LABEL_29;
LABEL_19:
  if (v8)
    goto LABEL_20;
LABEL_30:

LABEL_20:
  if (!v7)

  if (!v6)
  if (v24)
  {
    if (v25)
      goto LABEL_26;
LABEL_32:

    if (v26)
      goto LABEL_27;
LABEL_33:

    goto LABEL_27;
  }

  if (!v25)
    goto LABEL_32;
LABEL_26:
  if (!v26)
    goto LABEL_33;
LABEL_27:

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  char v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v18 = 0;
    goto LABEL_13;
  }
  v5 = v4;
  v6 = -[BMSensitiveContentAnalysisUIInteraction interactionType](self, "interactionType");
  if (v6 != objc_msgSend(v5, "interactionType"))
    goto LABEL_10;
  v7 = -[BMSensitiveContentAnalysisUIInteraction ageGroup](self, "ageGroup");
  if (v7 != objc_msgSend(v5, "ageGroup"))
    goto LABEL_10;
  v8 = -[BMSensitiveContentAnalysisUIInteraction eventDirection](self, "eventDirection");
  if (v8 != objc_msgSend(v5, "eventDirection"))
    goto LABEL_10;
  v9 = -[BMSensitiveContentAnalysisUIInteraction screen](self, "screen");
  if (v9 != objc_msgSend(v5, "screen"))
    goto LABEL_10;
  v10 = -[BMSensitiveContentAnalysisUIInteraction action](self, "action");
  if (v10 != objc_msgSend(v5, "action"))
    goto LABEL_10;
  v11 = -[BMSensitiveContentAnalysisUIInteraction contentType](self, "contentType");
  if (v11 != objc_msgSend(v5, "contentType"))
    goto LABEL_10;
  -[BMSensitiveContentAnalysisUIInteraction clientBundleID](self, "clientBundleID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientBundleID");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v12 == (void *)v13)
  {

    goto LABEL_15;
  }
  v14 = (void *)v13;
  -[BMSensitiveContentAnalysisUIInteraction clientBundleID](self, "clientBundleID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientBundleID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqual:", v16);

  if (v17)
  {
LABEL_15:
    -[BMSensitiveContentAnalysisUIInteraction trackingVersion](self, "trackingVersion");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trackingVersion");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20 == v21)
    {
      v18 = 1;
    }
    else
    {
      -[BMSensitiveContentAnalysisUIInteraction trackingVersion](self, "trackingVersion");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "trackingVersion");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v22, "isEqual:", v23);

    }
    goto LABEL_11;
  }
LABEL_10:
  v18 = 0;
LABEL_11:

LABEL_13:
  return v18;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)interactionType
{
  return self->_interactionType;
}

- (int)ageGroup
{
  return self->_ageGroup;
}

- (int)eventDirection
{
  return self->_eventDirection;
}

- (int)screen
{
  return self->_screen;
}

- (int)action
{
  return self->_action;
}

- (int)contentType
{
  return self->_contentType;
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (NSString)trackingVersion
{
  return self->_trackingVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingVersion, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
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

    v4 = -[BMSensitiveContentAnalysisUIInteraction initByReadFrom:]([BMSensitiveContentAnalysisUIInteraction alloc], "initByReadFrom:", v7);
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
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[9];

  v12[8] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("interactionType"), 0, 0, 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("ageGroup"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("eventDirection"), 0, 0, 3, 4, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("screen"), 0, 0, 4, 4, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("action"), 0, 0, 5, 4, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("contentType"), 0, 0, 6, 4, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clientBundleID"), 2, 0, 7, 13, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("trackingVersion"), 2, 0, 8, 13, 0);
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
  return &unk_1E5F1AAB8;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("interactionType"), 1, 4, 0);
  v12[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("ageGroup"), 2, 4, 0);
  v12[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("eventDirection"), 3, 4, 0);
  v12[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("screen"), 4, 4, 0);
  v12[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("action"), 5, 4, 0);
  v12[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("contentType"), 6, 4, 0);
  v12[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clientBundleID"), 7, 13, 0);
  v12[6] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("trackingVersion"), 8, 13, 0);
  v12[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
