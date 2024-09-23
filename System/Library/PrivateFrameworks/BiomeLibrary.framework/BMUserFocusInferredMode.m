@implementation BMUserFocusInferredMode

- (BMUserFocusInferredMode)initWithAbsoluteTimestamp:(id)a3 modeIdentifier:(id)a4 origin:(int)a5 originBundleID:(id)a6 isAutomationEnabled:(id)a7 isStart:(id)a8 uuid:(id)a9 originAnchorType:(id)a10 uiLocation:(id)a11 confidenceScore:(id)a12 serializedTriggers:(id)a13 modeType:(int)a14 shouldSuggestTriggers:(id)a15 userModeName:(id)a16
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  BMUserFocusInferredMode *v28;
  double v29;
  uint64_t v30;
  double v31;
  id obj;
  id v35;
  id v37;
  id v38;
  id v39;
  id v40;
  objc_super v41;

  v20 = a3;
  obj = a4;
  v40 = a4;
  v35 = a6;
  v39 = a6;
  v21 = a7;
  v22 = a8;
  v38 = a9;
  v37 = a10;
  v23 = a11;
  v24 = a12;
  v25 = a13;
  v26 = a15;
  v27 = a16;
  v41.receiver = self;
  v41.super_class = (Class)BMUserFocusInferredMode;
  v28 = -[BMEventBase init](&v41, sel_init);
  if (v28)
  {
    v28->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v20)
    {
      v28->_hasRaw_absoluteTimestamp = 1;
      objc_msgSend(v20, "timeIntervalSinceReferenceDate");
    }
    else
    {
      v28->_hasRaw_absoluteTimestamp = 0;
      v29 = -1.0;
    }
    v28->_raw_absoluteTimestamp = v29;
    objc_storeStrong((id *)&v28->_modeIdentifier, obj);
    v28->_origin = a5;
    objc_storeStrong((id *)&v28->_originBundleID, v35);
    if (v21)
    {
      v28->_hasIsAutomationEnabled = 1;
      v28->_isAutomationEnabled = objc_msgSend(v21, "BOOLValue");
    }
    else
    {
      v28->_hasIsAutomationEnabled = 0;
      v28->_isAutomationEnabled = 0;
    }
    if (v22)
    {
      v28->_hasIsStart = 1;
      v28->_isStart = objc_msgSend(v22, "BOOLValue");
    }
    else
    {
      v28->_hasIsStart = 0;
      v28->_isStart = 0;
    }
    objc_storeStrong((id *)&v28->_uuid, a9);
    objc_storeStrong((id *)&v28->_originAnchorType, a10);
    if (v23)
    {
      v28->_hasUiLocation = 1;
      v30 = objc_msgSend(v23, "unsignedLongLongValue");
    }
    else
    {
      v30 = 0;
      v28->_hasUiLocation = 0;
    }
    v28->_uiLocation = v30;
    if (v24)
    {
      v28->_hasConfidenceScore = 1;
      objc_msgSend(v24, "doubleValue");
    }
    else
    {
      v28->_hasConfidenceScore = 0;
      v31 = -1.0;
    }
    v28->_confidenceScore = v31;
    objc_storeStrong((id *)&v28->_serializedTriggers, a13);
    v28->_modeType = a14;
    if (v26)
    {
      v28->_hasShouldSuggestTriggers = 1;
      v28->_shouldSuggestTriggers = objc_msgSend(v26, "BOOLValue");
    }
    else
    {
      v28->_hasShouldSuggestTriggers = 0;
      v28->_shouldSuggestTriggers = 0;
    }
    objc_storeStrong((id *)&v28->_userModeName, a16);
  }

  return v28;
}

- (NSString)description
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
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v15 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMUserFocusInferredMode absoluteTimestamp](self, "absoluteTimestamp");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMUserFocusInferredMode modeIdentifier](self, "modeIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  BMUserFocusInferredModeOriginAsString(-[BMUserFocusInferredMode origin](self, "origin"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMUserFocusInferredMode originBundleID](self, "originBundleID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMUserFocusInferredMode isAutomationEnabled](self, "isAutomationEnabled"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMUserFocusInferredMode isStart](self, "isStart"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMUserFocusInferredMode uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMUserFocusInferredMode originAnchorType](self, "originAnchorType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[BMUserFocusInferredMode uiLocation](self, "uiLocation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[BMUserFocusInferredMode confidenceScore](self, "confidenceScore");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMUserFocusInferredMode serializedTriggers](self, "serializedTriggers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  BMUserFocusInferredModeTypeAsString(-[BMUserFocusInferredMode modeType](self, "modeType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMUserFocusInferredMode shouldSuggestTriggers](self, "shouldSuggestTriggers"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMUserFocusInferredMode userModeName](self, "userModeName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v15, "initWithFormat:", CFSTR("BMUserFocusInferredMode with absoluteTimestamp: %@, modeIdentifier: %@, origin: %@, originBundleID: %@, isAutomationEnabled: %@, isStart: %@, uuid: %@, originAnchorType: %@, uiLocation: %@, confidenceScore: %@, serializedTriggers: %@, modeType: %@, shouldSuggestTriggers: %@, userModeName: %@"), v20, v19, v18, v17, v14, v3, v4, v5, v6, v8, v9, v10, v11, v12);

  return (NSString *)v16;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMUserFocusInferredMode *v5;
  void *v6;
  int *v7;
  int *v8;
  int *v9;
  int *v10;
  char v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  BOOL v18;
  int v19;
  uint64_t v21;
  unint64_t v22;
  objc_class *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  char v40;
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  char v47;
  unsigned int v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  char v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  void *v57;
  char v58;
  unsigned int v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  char v63;
  char v64;
  unsigned int v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  char v70;
  void *v71;
  uint64_t v72;
  BOOL v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  NSArray *serializedTriggers;
  int v78;
  BMUserFocusInferredMode *v79;
  objc_super v81;

  v4 = a3;
  v81.receiver = self;
  v81.super_class = (Class)BMUserFocusInferredMode;
  v5 = -[BMEventBase init](&v81, sel_init);
  if (!v5)
    goto LABEL_116;
  v6 = (void *)objc_opt_new();
  v7 = (int *)MEMORY[0x1E0D82BF0];
  v8 = (int *)MEMORY[0x1E0D82BD8];
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v10 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v9])
        break;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      while (1)
      {
        v14 = *v7;
        v15 = *(_QWORD *)&v4[v14];
        v16 = v15 + 1;
        if (v15 == -1 || v16 > *(_QWORD *)&v4[*v8])
          break;
        v17 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v15);
        *(_QWORD *)&v4[v14] = v16;
        v13 |= (unint64_t)(v17 & 0x7F) << v11;
        if ((v17 & 0x80) == 0)
          goto LABEL_13;
        v11 += 7;
        v18 = v12++ >= 9;
        if (v18)
        {
          v13 = 0;
          v19 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      v19 = v4[*v9];
      if (v4[*v9])
        v13 = 0;
LABEL_15:
      if (v19 || (v13 & 7) == 4)
        break;
      switch((v13 >> 3))
      {
        case 1u:
          v5->_hasRaw_absoluteTimestamp = 1;
          v21 = *v7;
          v22 = *(_QWORD *)&v4[v21];
          if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(_QWORD *)&v4[*v8])
          {
            v23 = *(objc_class **)(*(_QWORD *)&v4[*v10] + v22);
            *(_QWORD *)&v4[v21] = v22 + 8;
          }
          else
          {
            v4[*v9] = 1;
            v23 = 0;
          }
          v75 = 24;
          goto LABEL_112;
        case 2u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 56;
          goto LABEL_75;
        case 3u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          while (2)
          {
            v29 = *v7;
            v30 = *(_QWORD *)&v4[v29];
            v31 = v30 + 1;
            if (v30 == -1 || v31 > *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v32 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v30);
              *(_QWORD *)&v4[v29] = v31;
              v28 |= (unint64_t)(v32 & 0x7F) << v26;
              if (v32 < 0)
              {
                v26 += 7;
                v18 = v27++ >= 9;
                if (v18)
                {
                  LODWORD(v28) = 0;
                  goto LABEL_81;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            LODWORD(v28) = 0;
LABEL_81:
          if (v28 >= 0x12)
            LODWORD(v28) = 0;
          v72 = 44;
          goto LABEL_102;
        case 4u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 64;
          goto LABEL_75;
        case 5u:
          v33 = 0;
          v34 = 0;
          v35 = 0;
          v5->_hasIsAutomationEnabled = 1;
          while (2)
          {
            v36 = *v7;
            v37 = *(_QWORD *)&v4[v36];
            v38 = v37 + 1;
            if (v37 == -1 || v38 > *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v39 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v37);
              *(_QWORD *)&v4[v36] = v38;
              v35 |= (unint64_t)(v39 & 0x7F) << v33;
              if (v39 < 0)
              {
                v33 += 7;
                v18 = v34++ >= 9;
                if (v18)
                {
                  v35 = 0;
                  goto LABEL_87;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            v35 = 0;
LABEL_87:
          v73 = v35 != 0;
          v74 = 32;
          goto LABEL_107;
        case 6u:
          v40 = 0;
          v41 = 0;
          v42 = 0;
          v5->_hasIsStart = 1;
          while (2)
          {
            v43 = *v7;
            v44 = *(_QWORD *)&v4[v43];
            v45 = v44 + 1;
            if (v44 == -1 || v45 > *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v46 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v44);
              *(_QWORD *)&v4[v43] = v45;
              v42 |= (unint64_t)(v46 & 0x7F) << v40;
              if (v46 < 0)
              {
                v40 += 7;
                v18 = v41++ >= 9;
                if (v18)
                {
                  v42 = 0;
                  goto LABEL_91;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            v42 = 0;
LABEL_91:
          v73 = v42 != 0;
          v74 = 34;
          goto LABEL_107;
        case 7u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 72;
          goto LABEL_75;
        case 8u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 80;
          goto LABEL_75;
        case 9u:
          v47 = 0;
          v48 = 0;
          v49 = 0;
          v5->_hasUiLocation = 1;
          while (2)
          {
            v50 = *v7;
            v51 = *(_QWORD *)&v4[v50];
            v52 = v51 + 1;
            if (v51 == -1 || v52 > *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v53 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v51);
              *(_QWORD *)&v4[v50] = v52;
              v49 |= (unint64_t)(v53 & 0x7F) << v47;
              if (v53 < 0)
              {
                v47 += 7;
                v18 = v48++ >= 9;
                if (v18)
                {
                  v49 = 0;
                  goto LABEL_95;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            v49 = 0;
LABEL_95:
          v5->_uiLocation = v49;
          continue;
        case 0xAu:
          v5->_hasConfidenceScore = 1;
          v54 = *v7;
          v55 = *(_QWORD *)&v4[v54];
          if (v55 <= 0xFFFFFFFFFFFFFFF7 && v55 + 8 <= *(_QWORD *)&v4[*v8])
          {
            v23 = *(objc_class **)(*(_QWORD *)&v4[*v10] + v55);
            *(_QWORD *)&v4[v54] = v55 + 8;
          }
          else
          {
            v4[*v9] = 1;
            v23 = 0;
          }
          v75 = 96;
LABEL_112:
          *(Class *)((char *)&v5->super.super.isa + v75) = v23;
          continue;
        case 0xBu:
          PBReaderReadData();
          v56 = objc_claimAutoreleasedReturnValue();
          if (!v56)
            goto LABEL_118;
          v57 = (void *)v56;
          objc_msgSend(v6, "addObject:", v56);

          continue;
        case 0xCu:
          v58 = 0;
          v59 = 0;
          v28 = 0;
          while (2)
          {
            v60 = *v7;
            v61 = *(_QWORD *)&v4[v60];
            v62 = v61 + 1;
            if (v61 == -1 || v62 > *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v63 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v61);
              *(_QWORD *)&v4[v60] = v62;
              v28 |= (unint64_t)(v63 & 0x7F) << v58;
              if (v63 < 0)
              {
                v58 += 7;
                v18 = v59++ >= 9;
                if (v18)
                {
                  LODWORD(v28) = 0;
                  goto LABEL_99;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            LODWORD(v28) = 0;
LABEL_99:
          if (v28 >= 0x13)
            LODWORD(v28) = 0;
          v72 = 48;
LABEL_102:
          *(_DWORD *)((char *)&v5->super.super.isa + v72) = v28;
          continue;
        case 0xDu:
          v64 = 0;
          v65 = 0;
          v66 = 0;
          v5->_hasShouldSuggestTriggers = 1;
          break;
        case 0xEu:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 112;
LABEL_75:
          v71 = *(Class *)((char *)&v5->super.super.isa + v25);
          *(Class *)((char *)&v5->super.super.isa + v25) = (Class)v24;

          continue;
        default:
          if (PBReaderSkipValueWithTag())
            continue;
LABEL_118:

          goto LABEL_115;
      }
      while (1)
      {
        v67 = *v7;
        v68 = *(_QWORD *)&v4[v67];
        v69 = v68 + 1;
        if (v68 == -1 || v69 > *(_QWORD *)&v4[*v8])
          break;
        v70 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v68);
        *(_QWORD *)&v4[v67] = v69;
        v66 |= (unint64_t)(v70 & 0x7F) << v64;
        if ((v70 & 0x80) == 0)
          goto LABEL_104;
        v64 += 7;
        v18 = v65++ >= 9;
        if (v18)
        {
          v66 = 0;
          goto LABEL_106;
        }
      }
      v4[*v9] = 1;
LABEL_104:
      if (v4[*v9])
        v66 = 0;
LABEL_106:
      v73 = v66 != 0;
      v74 = 38;
LABEL_107:
      *((_BYTE *)&v5->super.super.isa + v74) = v73;
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  v76 = objc_msgSend(v6, "copy");
  serializedTriggers = v5->_serializedTriggers;
  v5->_serializedTriggers = (NSArray *)v76;

  v78 = v4[*v9];
  if (v78)
LABEL_115:
    v79 = 0;
  else
LABEL_116:
    v79 = v5;

  return v79;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_hasRaw_absoluteTimestamp)
    PBDataWriterWriteDoubleField();
  if (self->_modeIdentifier)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  if (self->_originBundleID)
    PBDataWriterWriteStringField();
  if (self->_hasIsAutomationEnabled)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsStart)
    PBDataWriterWriteBOOLField();
  if (self->_uuid)
    PBDataWriterWriteStringField();
  if (self->_originAnchorType)
    PBDataWriterWriteStringField();
  if (self->_hasUiLocation)
    PBDataWriterWriteUint64Field();
  if (self->_hasConfidenceScore)
    PBDataWriterWriteDoubleField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_serializedTriggers;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteDataField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  PBDataWriterWriteUint32Field();
  if (self->_hasShouldSuggestTriggers)
    PBDataWriterWriteBOOLField();
  if (self->_userModeName)
    PBDataWriterWriteStringField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMUserFocusInferredMode writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMUserFocusInferredMode)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  id v9;
  id v10;
  double v11;
  double v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  int v34;
  void *v35;
  id v36;
  uint64_t v37;
  id *v38;
  id v39;
  BMUserFocusInferredMode *v40;
  uint64_t v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  uint64_t v61;
  void *v62;
  id v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  id v68;
  void *v69;
  uint64_t v70;
  void *v71;
  id v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  id v78;
  id v79;
  void *v80;
  uint64_t v81;
  void *v82;
  id v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  id v87;
  id v88;
  uint64_t v89;
  void *v90;
  id v91;
  void *v92;
  id v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  id v99;
  void *v100;
  uint64_t v101;
  void *v102;
  id v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  id v108;
  id v109;
  uint64_t v110;
  void *v111;
  id v112;
  void *v113;
  uint64_t v114;
  void *v115;
  id v116;
  void *v117;
  uint64_t v118;
  uint64_t v119;
  id v120;
  void *v121;
  id v122;
  uint64_t v123;
  id v124;
  id v125;
  uint64_t v126;
  uint64_t v127;
  id v128;
  id v129;
  uint64_t v130;
  uint64_t v131;
  id v132;
  uint64_t v133;
  void *v134;
  id v135;
  uint64_t v136;
  void *v137;
  id v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  void *v143;
  id v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  id v156;
  id v157;
  void *v158;
  void *v159;
  id v160;
  id v161;
  void *v162;
  id v163;
  void *v164;
  id v165;
  void *v166;
  uint64_t v167;
  BMUserFocusInferredMode *v168;
  void *v169;
  void *v170;
  id v171;
  void *v172;
  void *v173;
  id v174;
  id v175;
  void *v176;
  id v177;
  id v178;
  id *v179;
  id v180;
  void *v181;
  void *v182;
  void *v183;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  uint64_t v189;
  void *v190;
  uint64_t v191;
  id v192;
  uint64_t v193;
  id v194;
  uint64_t v195;
  void *v196;
  uint64_t v197;
  void *v198;
  _BYTE v199[128];
  uint64_t v200;
  void *v201;
  uint64_t v202;
  id v203;
  uint64_t v204;
  id v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  id v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  id v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  id v217;
  uint64_t v218;
  id *v219;
  uint64_t v220;
  _QWORD v221[3];

  v221[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("absoluteTimestamp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = 0;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (objc_class *)MEMORY[0x1E0C99D68];
    v9 = v6;
    v10 = [v8 alloc];
    objc_msgSend(v9, "doubleValue");
    v12 = v11;

    v13 = (id)objc_msgSend(v10, "initWithTimeIntervalSinceReferenceDate:", v12);
LABEL_6:
    v7 = (uint64_t)v13;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v111 = 0;
        v40 = 0;
        goto LABEL_143;
      }
      v125 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v126 = *MEMORY[0x1E0D025B8];
      v220 = *MEMORY[0x1E0CB2D50];
      v127 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("absoluteTimestamp"));
      v221[0] = v127;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v221, &v220, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v128 = (id)objc_msgSend(v125, "initWithDomain:code:userInfo:", v126, 2, v15);
      v111 = 0;
      v40 = 0;
      *a4 = v128;
      v35 = (void *)v127;
      goto LABEL_142;
    }
    v13 = v6;
    goto LABEL_6;
  }
  v14 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
  objc_msgSend(v14, "dateFromString:", v6);
  v7 = objc_claimAutoreleasedReturnValue();

LABEL_9:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("modeIdentifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v182 = v6;
  v183 = (void *)v7;
  if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v16 = 0;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = v15;
LABEL_12:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("origin"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v179 = 0;
      goto LABEL_15;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v179 = v17;
      goto LABEL_15;
    }
    v35 = v16;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMUserFocusInferredModeOriginFromString(v17));
      v179 = (id *)objc_claimAutoreleasedReturnValue();
LABEL_15:
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("originBundleID"));
      v18 = objc_claimAutoreleasedReturnValue();
      v180 = v16;
      v181 = (void *)v18;
      if (!v18 || (v19 = (void *)v18, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v20 = 0;
        goto LABEL_18;
      }
      v35 = v16;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = v19;
LABEL_18:
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isAutomationEnabled"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v177 = v20;
        if (!v21 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v173 = v21;
          v174 = 0;
          goto LABEL_21;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v173 = v21;
          v174 = v21;
LABEL_21:
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isStart"));
          v22 = objc_claimAutoreleasedReturnValue();
          v176 = (void *)v22;
          if (!v22 || (v23 = (void *)v22, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v175 = 0;
            goto LABEL_24;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v175 = v23;
LABEL_24:
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("uuid"));
            v24 = objc_claimAutoreleasedReturnValue();
            v172 = (void *)v24;
            if (!v24 || (v25 = (void *)v24, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v165 = 0;
LABEL_27:
              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("originAnchorType"));
              v26 = objc_claimAutoreleasedReturnValue();
              v170 = (void *)v26;
              if (v26 && (v27 = (void *)v26, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if (!a4)
                  {
                    v171 = 0;
                    v40 = 0;
                    v38 = v179;
                    v49 = v173;
                    v77 = v165;
                    goto LABEL_135;
                  }
                  v99 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v100 = v15;
                  v101 = *MEMORY[0x1E0D025B8];
                  v206 = *MEMORY[0x1E0CB2D50];
                  v102 = v17;
                  v103 = objc_alloc(MEMORY[0x1E0CB3940]);
                  v151 = objc_opt_class();
                  v104 = v103;
                  v17 = v102;
                  v105 = objc_msgSend(v104, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v151, CFSTR("originAnchorType"));
                  v207 = v105;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v207, &v206, 1);
                  v106 = objc_claimAutoreleasedReturnValue();
                  v107 = v101;
                  v15 = v100;
                  v58 = (void *)v105;
                  v164 = (void *)v106;
                  v108 = (id)objc_msgSend(v99, "initWithDomain:code:userInfo:", v107, 2);
                  v171 = 0;
                  v40 = 0;
                  *a4 = v108;
                  v20 = v177;
                  v38 = v179;
                  goto LABEL_148;
                }
                v171 = v27;
              }
              else
              {
                v171 = 0;
              }
              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("uiLocation"));
              v28 = objc_claimAutoreleasedReturnValue();
              v164 = (void *)v28;
              if (!v28 || (v29 = (void *)v28, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v160 = 0;
LABEL_33:
                objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("confidenceScore"));
                v30 = objc_claimAutoreleasedReturnValue();
                v158 = v17;
                v159 = v15;
                v162 = (void *)v30;
                if (v30 && (v31 = (void *)v30, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    if (a4)
                    {
                      v122 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v123 = *MEMORY[0x1E0D025B8];
                      v202 = *MEMORY[0x1E0CB2D50];
                      v32 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("confidenceScore"));
                      v203 = v32;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v203, &v202, 1);
                      v50 = (void *)objc_claimAutoreleasedReturnValue();
                      v124 = (id)objc_msgSend(v122, "initWithDomain:code:userInfo:", v123, 2, v50);
                      v163 = 0;
                      v40 = 0;
                      *a4 = v124;
                      v20 = v177;
                      v38 = v179;
                      v49 = v173;
                      v77 = v165;
                      v58 = v160;
                      goto LABEL_131;
                    }
                    v163 = 0;
                    v40 = 0;
                    v20 = v177;
                    v38 = v179;
                    v49 = v173;
                    v77 = v165;
                    v58 = v160;
                    goto LABEL_133;
                  }
                  v163 = v31;
                }
                else
                {
                  v163 = 0;
                }
                objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("serializedTriggers"));
                v32 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v34 = objc_msgSend(v32, "isEqual:", v33);

                if (v34)
                {
                  v168 = self;

                  v32 = 0;
                }
                else
                {
                  if (v32)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      if (!a4)
                      {
                        v40 = 0;
                        v20 = v177;
                        v38 = v179;
                        v49 = v173;
                        v77 = v165;
                        v58 = v160;
                        goto LABEL_132;
                      }
                      v129 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v130 = *MEMORY[0x1E0D025B8];
                      v200 = *MEMORY[0x1E0CB2D50];
                      v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("serializedTriggers"));
                      v201 = v50;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v201, &v200, 1);
                      v131 = objc_claimAutoreleasedReturnValue();
                      v132 = (id)objc_msgSend(v129, "initWithDomain:code:userInfo:", v130, 2, v131);
                      v40 = 0;
                      *a4 = v132;
                      v121 = (void *)v131;
                      goto LABEL_107;
                    }
                  }
                  v168 = self;
                }
                v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v32, "count"));
                v185 = 0u;
                v186 = 0u;
                v187 = 0u;
                v188 = 0u;
                v32 = v32;
                v51 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v185, v199, 16);
                if (!v51)
                  goto LABEL_70;
                v52 = v51;
                v53 = *(_QWORD *)v186;
LABEL_63:
                v54 = 0;
                while (1)
                {
                  if (*(_QWORD *)v186 != v53)
                    objc_enumerationMutation(v32);
                  v55 = *(_QWORD *)(*((_QWORD *)&v185 + 1) + 8 * v54);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                    break;
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    if (a4)
                    {
                      v109 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v110 = *MEMORY[0x1E0D025B8];
                      v195 = *MEMORY[0x1E0CB2D50];
                      v155 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSData"), objc_opt_class(), CFSTR("serializedTriggers"));
                      v196 = v155;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v196, &v195, 1);
                      v96 = objc_claimAutoreleasedReturnValue();
                      v97 = v109;
                      v98 = v110;
                      goto LABEL_93;
                    }
                    goto LABEL_97;
                  }
                  objc_msgSend(v50, "addObject:", v55);
                  if (v52 == ++v54)
                  {
                    v52 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v185, v199, 16);
                    if (v52)
                      goto LABEL_63;
LABEL_70:

                    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("modeType"));
                    v56 = objc_claimAutoreleasedReturnValue();
                    v155 = (void *)v56;
                    if (!v56)
                    {
                      v157 = 0;
                      self = v168;
LABEL_110:
                      v20 = v177;
                      v77 = v165;
                      v58 = v160;
                      goto LABEL_117;
                    }
                    v57 = (void *)v56;
                    objc_opt_class();
                    self = v168;
                    v58 = v160;
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v157 = 0;
                      goto LABEL_116;
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v157 = v57;
LABEL_116:
                      v20 = v177;
                      v77 = v165;
LABEL_117:
                      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("shouldSuggestTriggers"));
                      v133 = objc_claimAutoreleasedReturnValue();
                      v169 = (void *)v133;
                      if (!v133 || (v134 = (void *)v133, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        v156 = 0;
                        goto LABEL_120;
                      }
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v156 = v134;
LABEL_120:
                        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("userModeName"));
                        v135 = (id)objc_claimAutoreleasedReturnValue();
                        v166 = v135;
                        if (!v135)
                        {
LABEL_123:
                          v38 = v179;
                          goto LABEL_124;
                        }
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v135 = 0;
                          goto LABEL_123;
                        }
                        objc_opt_class();
                        v38 = v179;
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v135 = v135;
                          v20 = v177;
LABEL_124:
                          v136 = objc_msgSend(v38, "intValue");
                          LODWORD(v153) = objc_msgSend(v157, "intValue");
                          self = -[BMUserFocusInferredMode initWithAbsoluteTimestamp:modeIdentifier:origin:originBundleID:isAutomationEnabled:isStart:uuid:originAnchorType:uiLocation:confidenceScore:serializedTriggers:modeType:shouldSuggestTriggers:userModeName:](self, "initWithAbsoluteTimestamp:modeIdentifier:origin:originBundleID:isAutomationEnabled:isStart:uuid:originAnchorType:uiLocation:confidenceScore:serializedTriggers:modeType:shouldSuggestTriggers:userModeName:", v183, v180, v136, v20, v174, v175, v77, v171, v58, v163, v50, v153, v156, v135);
                          v40 = self;
                        }
                        else
                        {
                          if (a4)
                          {
                            v161 = objc_alloc(MEMORY[0x1E0CB35C8]);
                            v154 = *MEMORY[0x1E0D025B8];
                            v189 = *MEMORY[0x1E0CB2D50];
                            v142 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("userModeName"));
                            v190 = v142;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v190, &v189, 1);
                            v143 = (void *)objc_claimAutoreleasedReturnValue();
                            *a4 = (id)objc_msgSend(v161, "initWithDomain:code:userInfo:", v154, 2, v143);

                          }
                          v135 = 0;
                          v40 = 0;
                          v20 = v177;
                        }
LABEL_125:

                      }
                      else
                      {
                        if (a4)
                        {
                          v139 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v167 = *MEMORY[0x1E0D025B8];
                          v191 = *MEMORY[0x1E0CB2D50];
                          v135 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("shouldSuggestTriggers"));
                          v192 = v135;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v192, &v191, 1);
                          v140 = objc_claimAutoreleasedReturnValue();
                          v141 = v167;
                          v166 = (void *)v140;
                          v40 = 0;
                          v156 = 0;
                          *a4 = (id)objc_msgSend(v139, "initWithDomain:code:userInfo:", v141, 2);
                          v20 = v177;
                          v38 = v179;
                          goto LABEL_125;
                        }
                        v156 = 0;
                        v40 = 0;
                        v20 = v177;
                        v38 = v179;
                      }
                      v137 = v169;
LABEL_127:

LABEL_128:
                      v49 = v173;

                      goto LABEL_129;
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMUserFocusInferredModeTypeFromString(v57));
                      v157 = (id)objc_claimAutoreleasedReturnValue();
                      goto LABEL_110;
                    }
                    if (a4)
                    {
                      v144 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v145 = *MEMORY[0x1E0D025B8];
                      v193 = *MEMORY[0x1E0CB2D50];
                      v156 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("modeType"));
                      v194 = v156;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v194, &v193, 1);
                      v137 = (void *)objc_claimAutoreleasedReturnValue();
                      v157 = 0;
                      v40 = 0;
                      *a4 = (id)objc_msgSend(v144, "initWithDomain:code:userInfo:", v145, 2, v137);
                      v20 = v177;
                      v38 = v179;
                      v77 = v165;
                      v58 = v160;
                      goto LABEL_127;
                    }
                    v157 = 0;
                    v40 = 0;
                    v20 = v177;
                    v38 = v179;
                    v49 = v173;
                    v77 = v165;
                    v58 = v160;
LABEL_129:

                    v121 = v157;
LABEL_130:

LABEL_131:
                    v17 = v158;
LABEL_132:

                    v15 = v159;
LABEL_133:

LABEL_134:
LABEL_135:
                    v48 = v174;
LABEL_136:

                    goto LABEL_137;
                  }
                }
                if (a4)
                {
                  v94 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v95 = *MEMORY[0x1E0D025B8];
                  v197 = *MEMORY[0x1E0CB2D50];
                  v155 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("serializedTriggers"));
                  v198 = v155;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v198, &v197, 1);
                  v96 = objc_claimAutoreleasedReturnValue();
                  v97 = v94;
                  v98 = v95;
LABEL_93:
                  v156 = (id)v96;
                  v77 = v165;
                  self = v168;
                  v20 = v177;
                  v38 = v179;
                  v58 = v160;
                  v40 = 0;
                  *a4 = (id)objc_msgSend(v97, "initWithDomain:code:userInfo:", v98, 2);
                  v157 = v32;
                  goto LABEL_128;
                }
LABEL_97:
                v40 = 0;
                v121 = v32;
                self = v168;
LABEL_107:
                v20 = v177;
                v38 = v179;
                v49 = v173;
                v77 = v165;
                v58 = v160;
                goto LABEL_130;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v160 = v29;
                goto LABEL_33;
              }
              if (a4)
              {
                v112 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v113 = v15;
                v114 = *MEMORY[0x1E0D025B8];
                v204 = *MEMORY[0x1E0CB2D50];
                v115 = v17;
                v116 = objc_alloc(MEMORY[0x1E0CB3940]);
                v152 = objc_opt_class();
                v117 = v116;
                v17 = v115;
                v163 = (id)objc_msgSend(v117, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v152, CFSTR("uiLocation"));
                v205 = v163;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v205, &v204, 1);
                v118 = objc_claimAutoreleasedReturnValue();
                v119 = v114;
                v15 = v113;
                v162 = (void *)v118;
                v120 = (id)objc_msgSend(v112, "initWithDomain:code:userInfo:", v119, 2);
                v58 = 0;
                v40 = 0;
                *a4 = v120;
                v38 = v179;
                v49 = v173;
                v77 = v165;
                goto LABEL_133;
              }
              v58 = 0;
              v40 = 0;
              v38 = v179;
LABEL_148:
              v49 = v173;
              v77 = v165;
              goto LABEL_134;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v165 = v25;
              goto LABEL_27;
            }
            if (a4)
            {
              v79 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v80 = v15;
              v81 = *MEMORY[0x1E0D025B8];
              v208 = *MEMORY[0x1E0CB2D50];
              v82 = v17;
              v83 = objc_alloc(MEMORY[0x1E0CB3940]);
              v149 = objc_opt_class();
              v84 = v83;
              v17 = v82;
              v171 = (id)objc_msgSend(v84, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v149, CFSTR("uuid"));
              v209 = v171;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v209, &v208, 1);
              v85 = objc_claimAutoreleasedReturnValue();
              v86 = v81;
              v15 = v80;
              v48 = v174;
              v170 = (void *)v85;
              v87 = (id)objc_msgSend(v79, "initWithDomain:code:userInfo:", v86, 2);
              v77 = 0;
              v40 = 0;
              *a4 = v87;
              v38 = v179;
              v49 = v173;
              goto LABEL_136;
            }
            v40 = 0;
            v38 = v179;
            v49 = v173;
            v48 = v174;
            v77 = 0;
LABEL_137:

            goto LABEL_138;
          }
          if (a4)
          {
            v68 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v69 = v15;
            v70 = *MEMORY[0x1E0D025B8];
            v210 = *MEMORY[0x1E0CB2D50];
            v71 = v17;
            v72 = objc_alloc(MEMORY[0x1E0CB3940]);
            v148 = objc_opt_class();
            v73 = v72;
            v17 = v71;
            v74 = objc_msgSend(v73, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v148, CFSTR("isStart"));
            v211 = v74;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v211, &v210, 1);
            v75 = objc_claimAutoreleasedReturnValue();
            v76 = v70;
            v15 = v69;
            v77 = (void *)v74;
            v48 = v174;
            v172 = (void *)v75;
            v78 = (id)objc_msgSend(v68, "initWithDomain:code:userInfo:", v76, 2);
            v175 = 0;
            v40 = 0;
            *a4 = v78;
            v38 = v179;
            v49 = v173;
            goto LABEL_137;
          }
          v175 = 0;
          v40 = 0;
          v38 = v179;
          v49 = v173;
          v48 = v174;
LABEL_138:

          goto LABEL_139;
        }
        if (a4)
        {
          v59 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v60 = v15;
          v61 = *MEMORY[0x1E0D025B8];
          v212 = *MEMORY[0x1E0CB2D50];
          v62 = v17;
          v63 = objc_alloc(MEMORY[0x1E0CB3940]);
          v147 = objc_opt_class();
          v49 = v21;
          v64 = v63;
          v17 = v62;
          v175 = (id)objc_msgSend(v64, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v147, CFSTR("isAutomationEnabled"));
          v213 = v175;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v213, &v212, 1);
          v65 = objc_claimAutoreleasedReturnValue();
          v66 = v61;
          v15 = v60;
          v176 = (void *)v65;
          v67 = (id)objc_msgSend(v59, "initWithDomain:code:userInfo:", v66, 2);
          v48 = 0;
          v40 = 0;
          *a4 = v67;
          v38 = v179;
          goto LABEL_138;
        }
        v40 = 0;
        v38 = v179;
        v49 = v21;
        v48 = 0;
LABEL_139:
        v111 = v183;

        v35 = v180;
        goto LABEL_140;
      }
      v40 = (BMUserFocusInferredMode *)a4;
      if (a4)
      {
        v178 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v41 = *MEMORY[0x1E0D025B8];
        v214 = *MEMORY[0x1E0CB2D50];
        v42 = v15;
        v43 = objc_alloc(MEMORY[0x1E0CB3940]);
        v146 = objc_opt_class();
        v44 = v43;
        v15 = v42;
        v45 = objc_msgSend(v44, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v146, CFSTR("originBundleID"));
        v215 = v45;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v215, &v214, 1);
        v46 = objc_claimAutoreleasedReturnValue();
        v47 = (id)objc_msgSend(v178, "initWithDomain:code:userInfo:", v41, 2, v46);
        v20 = 0;
        v40 = 0;
        *a4 = v47;
        v48 = (void *)v45;
        v49 = (void *)v46;
        v38 = v179;
        goto LABEL_139;
      }
      v20 = 0;
      v38 = v179;
LABEL_99:
      v111 = v183;
LABEL_140:

      goto LABEL_141;
    }
    v38 = a4;
    if (a4)
    {
      v88 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v89 = *MEMORY[0x1E0D025B8];
      v216 = *MEMORY[0x1E0CB2D50];
      v90 = v15;
      v91 = objc_alloc(MEMORY[0x1E0CB3940]);
      v150 = objc_opt_class();
      v92 = v91;
      v15 = v90;
      v20 = (id)objc_msgSend(v92, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), v150, CFSTR("origin"));
      v217 = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v217, &v216, 1);
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = (id)objc_msgSend(v88, "initWithDomain:code:userInfo:", v89, 2);
      v38 = 0;
      v40 = 0;
      *a4 = v93;
      goto LABEL_99;
    }
    v40 = 0;
LABEL_113:
    v111 = v183;
LABEL_141:

    v6 = v182;
    goto LABEL_142;
  }
  if (a4)
  {
    v36 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v37 = *MEMORY[0x1E0D025B8];
    v218 = *MEMORY[0x1E0CB2D50];
    v38 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("modeIdentifier"));
    v219 = v38;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v219, &v218, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (id)objc_msgSend(v36, "initWithDomain:code:userInfo:", v37, 2, v17);
    v35 = 0;
    v40 = 0;
    *a4 = v39;
    goto LABEL_113;
  }
  v40 = 0;
  v35 = 0;
  v111 = (void *)v7;
LABEL_142:

LABEL_143:
  return v40;
}

- (id)_serializedTriggersJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[BMUserFocusInferredMode serializedTriggers](self, "serializedTriggers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "base64EncodedStringWithOptions:", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  double v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  _QWORD v53[14];
  _QWORD v54[16];

  v54[14] = *MEMORY[0x1E0C80C00];
  -[BMUserFocusInferredMode absoluteTimestamp](self, "absoluteTimestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[BMUserFocusInferredMode absoluteTimestamp](self, "absoluteTimestamp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    objc_msgSend(v4, "numberWithDouble:");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  -[BMUserFocusInferredMode modeIdentifier](self, "modeIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMUserFocusInferredMode origin](self, "origin"));
  v8 = objc_claimAutoreleasedReturnValue();
  -[BMUserFocusInferredMode originBundleID](self, "originBundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMUserFocusInferredMode hasIsAutomationEnabled](self, "hasIsAutomationEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMUserFocusInferredMode isAutomationEnabled](self, "isAutomationEnabled"));
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  if (-[BMUserFocusInferredMode hasIsStart](self, "hasIsStart"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMUserFocusInferredMode isStart](self, "isStart"));
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  -[BMUserFocusInferredMode uuid](self, "uuid");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMUserFocusInferredMode originAnchorType](self, "originAnchorType");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMUserFocusInferredMode hasUiLocation](self, "hasUiLocation"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[BMUserFocusInferredMode uiLocation](self, "uiLocation"));
    v50 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v50 = 0;
  }
  if (!-[BMUserFocusInferredMode hasConfidenceScore](self, "hasConfidenceScore")
    || (-[BMUserFocusInferredMode confidenceScore](self, "confidenceScore"), fabs(v12) == INFINITY))
  {
    v49 = 0;
  }
  else
  {
    -[BMUserFocusInferredMode confidenceScore](self, "confidenceScore");
    v13 = (void *)MEMORY[0x1E0CB37E8];
    -[BMUserFocusInferredMode confidenceScore](self, "confidenceScore");
    objc_msgSend(v13, "numberWithDouble:");
    v49 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[BMUserFocusInferredMode _serializedTriggersJSONArray](self, "_serializedTriggersJSONArray");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMUserFocusInferredMode modeType](self, "modeType"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMUserFocusInferredMode hasShouldSuggestTriggers](self, "hasShouldSuggestTriggers"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMUserFocusInferredMode shouldSuggestTriggers](self, "shouldSuggestTriggers"));
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  -[BMUserFocusInferredMode userModeName](self, "userModeName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = CFSTR("absoluteTimestamp");
  v16 = (uint64_t)v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v41 = (void *)v16;
  v54[0] = v16;
  v53[1] = CFSTR("modeIdentifier");
  v17 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v40 = (void *)v17;
  v54[1] = v17;
  v53[2] = CFSTR("origin");
  v18 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v39 = (void *)v18;
  v54[2] = v18;
  v53[3] = CFSTR("originBundleID");
  v19 = (uint64_t)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v38 = (void *)v19;
  v54[3] = v19;
  v53[4] = CFSTR("isAutomationEnabled");
  v20 = (uint64_t)v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v37 = (void *)v20;
  v54[4] = v20;
  v53[5] = CFSTR("isStart");
  v21 = (uint64_t)v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v46 = (void *)v8;
  v36 = (void *)v21;
  v54[5] = v21;
  v53[6] = CFSTR("uuid");
  v22 = (uint64_t)v52;
  if (!v52)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v45 = v10;
  v54[6] = v22;
  v53[7] = CFSTR("originAnchorType");
  v23 = (uint64_t)v51;
  if (!v51)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = objc_claimAutoreleasedReturnValue();
  }
  v44 = v11;
  v54[7] = v23;
  v53[8] = CFSTR("uiLocation");
  v24 = v50;
  if (!v50)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v54[8] = v24;
  v53[9] = CFSTR("confidenceScore");
  v25 = v49;
  if (!v49)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v33 = v23;
  v35 = (void *)v22;
  v43 = v6;
  v54[9] = v25;
  v53[10] = CFSTR("serializedTriggers");
  v26 = v48;
  if (!v48)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v23, v35, v36, v37, v38, v39, v40, v41);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v7;
  v54[10] = v26;
  v53[11] = CFSTR("modeType");
  v28 = v47;
  if (!v47)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v54[11] = v28;
  v53[12] = CFSTR("shouldSuggestTriggers");
  v29 = v14;
  v30 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v54[12] = v29;
  v53[13] = CFSTR("userModeName");
  v31 = v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v54[13] = v31;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 14, v33);
  v42 = (id)objc_claimAutoreleasedReturnValue();
  if (!v15)

  if (!v30)
  if (!v47)

  if (!v48)
  if (!v49)

  if (!v50)
  if (!v51)

  if (!v52)
  if (v44)
  {
    if (v45)
      goto LABEL_66;
  }
  else
  {

    if (v45)
    {
LABEL_66:
      if (v9)
        goto LABEL_67;
      goto LABEL_73;
    }
  }

  if (v9)
  {
LABEL_67:
    if (v46)
      goto LABEL_68;
    goto LABEL_74;
  }
LABEL_73:

  if (v46)
  {
LABEL_68:
    if (v27)
      goto LABEL_69;
LABEL_75:

    if (v43)
      goto LABEL_70;
LABEL_76:

    goto LABEL_70;
  }
LABEL_74:

  if (!v27)
    goto LABEL_75;
LABEL_69:
  if (!v43)
    goto LABEL_76;
LABEL_70:

  return v42;
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
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  int v26;
  int v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  unint64_t v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  int v50;
  int v51;
  void *v53;
  void *v54;
  void *v55;
  void *v56;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMUserFocusInferredMode absoluteTimestamp](self, "absoluteTimestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteTimestamp");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMUserFocusInferredMode absoluteTimestamp](self, "absoluteTimestamp");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteTimestamp");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_54;
    }
    -[BMUserFocusInferredMode modeIdentifier](self, "modeIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "modeIdentifier");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMUserFocusInferredMode modeIdentifier](self, "modeIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "modeIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_54;
    }
    v19 = -[BMUserFocusInferredMode origin](self, "origin");
    if (v19 == objc_msgSend(v5, "origin"))
    {
      -[BMUserFocusInferredMode originBundleID](self, "originBundleID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "originBundleID");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v20 == (void *)v21)
      {

      }
      else
      {
        v22 = (void *)v21;
        -[BMUserFocusInferredMode originBundleID](self, "originBundleID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "originBundleID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "isEqual:", v24);

        if (!v25)
          goto LABEL_54;
      }
      if (-[BMUserFocusInferredMode hasIsAutomationEnabled](self, "hasIsAutomationEnabled")
        || objc_msgSend(v5, "hasIsAutomationEnabled"))
      {
        if (!-[BMUserFocusInferredMode hasIsAutomationEnabled](self, "hasIsAutomationEnabled"))
          goto LABEL_54;
        if (!objc_msgSend(v5, "hasIsAutomationEnabled"))
          goto LABEL_54;
        v26 = -[BMUserFocusInferredMode isAutomationEnabled](self, "isAutomationEnabled");
        if (v26 != objc_msgSend(v5, "isAutomationEnabled"))
          goto LABEL_54;
      }
      if (-[BMUserFocusInferredMode hasIsStart](self, "hasIsStart") || objc_msgSend(v5, "hasIsStart"))
      {
        if (!-[BMUserFocusInferredMode hasIsStart](self, "hasIsStart"))
          goto LABEL_54;
        if (!objc_msgSend(v5, "hasIsStart"))
          goto LABEL_54;
        v27 = -[BMUserFocusInferredMode isStart](self, "isStart");
        if (v27 != objc_msgSend(v5, "isStart"))
          goto LABEL_54;
      }
      -[BMUserFocusInferredMode uuid](self, "uuid");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uuid");
      v29 = objc_claimAutoreleasedReturnValue();
      if (v28 == (void *)v29)
      {

      }
      else
      {
        v30 = (void *)v29;
        -[BMUserFocusInferredMode uuid](self, "uuid");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "uuid");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v31, "isEqual:", v32);

        if (!v33)
          goto LABEL_54;
      }
      -[BMUserFocusInferredMode originAnchorType](self, "originAnchorType");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "originAnchorType");
      v35 = objc_claimAutoreleasedReturnValue();
      if (v34 == (void *)v35)
      {

      }
      else
      {
        v36 = (void *)v35;
        -[BMUserFocusInferredMode originAnchorType](self, "originAnchorType");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "originAnchorType");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v37, "isEqual:", v38);

        if (!v39)
          goto LABEL_54;
      }
      if (-[BMUserFocusInferredMode hasUiLocation](self, "hasUiLocation")
        || objc_msgSend(v5, "hasUiLocation"))
      {
        if (!-[BMUserFocusInferredMode hasUiLocation](self, "hasUiLocation"))
          goto LABEL_54;
        if (!objc_msgSend(v5, "hasUiLocation"))
          goto LABEL_54;
        v40 = -[BMUserFocusInferredMode uiLocation](self, "uiLocation");
        if (v40 != objc_msgSend(v5, "uiLocation"))
          goto LABEL_54;
      }
      if (-[BMUserFocusInferredMode hasConfidenceScore](self, "hasConfidenceScore")
        || objc_msgSend(v5, "hasConfidenceScore"))
      {
        if (!-[BMUserFocusInferredMode hasConfidenceScore](self, "hasConfidenceScore"))
          goto LABEL_54;
        if (!objc_msgSend(v5, "hasConfidenceScore"))
          goto LABEL_54;
        -[BMUserFocusInferredMode confidenceScore](self, "confidenceScore");
        v42 = v41;
        objc_msgSend(v5, "confidenceScore");
        if (v42 != v43)
          goto LABEL_54;
      }
      -[BMUserFocusInferredMode serializedTriggers](self, "serializedTriggers");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "serializedTriggers");
      v45 = objc_claimAutoreleasedReturnValue();
      if (v44 == (void *)v45)
      {

      }
      else
      {
        v46 = (void *)v45;
        -[BMUserFocusInferredMode serializedTriggers](self, "serializedTriggers");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "serializedTriggers");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v47, "isEqual:", v48);

        if (!v49)
          goto LABEL_54;
      }
      v50 = -[BMUserFocusInferredMode modeType](self, "modeType");
      if (v50 == objc_msgSend(v5, "modeType"))
      {
        if (!-[BMUserFocusInferredMode hasShouldSuggestTriggers](self, "hasShouldSuggestTriggers")
          && !objc_msgSend(v5, "hasShouldSuggestTriggers")
          || -[BMUserFocusInferredMode hasShouldSuggestTriggers](self, "hasShouldSuggestTriggers")
          && objc_msgSend(v5, "hasShouldSuggestTriggers")
          && (v51 = -[BMUserFocusInferredMode shouldSuggestTriggers](self, "shouldSuggestTriggers"),
              v51 == objc_msgSend(v5, "shouldSuggestTriggers")))
        {
          -[BMUserFocusInferredMode userModeName](self, "userModeName");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "userModeName");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          if (v53 == v54)
          {
            v12 = 1;
          }
          else
          {
            -[BMUserFocusInferredMode userModeName](self, "userModeName");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "userModeName");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v55, "isEqual:", v56);

          }
          goto LABEL_55;
        }
      }
    }
LABEL_54:
    v12 = 0;
LABEL_55:

    goto LABEL_56;
  }
  v12 = 0;
LABEL_56:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)modeIdentifier
{
  return self->_modeIdentifier;
}

- (int)origin
{
  return self->_origin;
}

- (NSString)originBundleID
{
  return self->_originBundleID;
}

- (BOOL)isAutomationEnabled
{
  return self->_isAutomationEnabled;
}

- (BOOL)hasIsAutomationEnabled
{
  return self->_hasIsAutomationEnabled;
}

- (void)setHasIsAutomationEnabled:(BOOL)a3
{
  self->_hasIsAutomationEnabled = a3;
}

- (BOOL)isStart
{
  return self->_isStart;
}

- (BOOL)hasIsStart
{
  return self->_hasIsStart;
}

- (void)setHasIsStart:(BOOL)a3
{
  self->_hasIsStart = a3;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (NSString)originAnchorType
{
  return self->_originAnchorType;
}

- (unint64_t)uiLocation
{
  return self->_uiLocation;
}

- (BOOL)hasUiLocation
{
  return self->_hasUiLocation;
}

- (void)setHasUiLocation:(BOOL)a3
{
  self->_hasUiLocation = a3;
}

- (double)confidenceScore
{
  return self->_confidenceScore;
}

- (BOOL)hasConfidenceScore
{
  return self->_hasConfidenceScore;
}

- (void)setHasConfidenceScore:(BOOL)a3
{
  self->_hasConfidenceScore = a3;
}

- (NSArray)serializedTriggers
{
  return self->_serializedTriggers;
}

- (int)modeType
{
  return self->_modeType;
}

- (BOOL)shouldSuggestTriggers
{
  return self->_shouldSuggestTriggers;
}

- (BOOL)hasShouldSuggestTriggers
{
  return self->_hasShouldSuggestTriggers;
}

- (void)setHasShouldSuggestTriggers:(BOOL)a3
{
  self->_hasShouldSuggestTriggers = a3;
}

- (NSString)userModeName
{
  return self->_userModeName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userModeName, 0);
  objc_storeStrong((id *)&self->_serializedTriggers, 0);
  objc_storeStrong((id *)&self->_originAnchorType, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_originBundleID, 0);
  objc_storeStrong((id *)&self->_modeIdentifier, 0);
}

+ (unsigned)latestDataVersion
{
  return 2;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  __objc2_class **v6;
  void *v7;
  _DWORD *v8;

  v5 = a3;
  if (a4 == 2)
  {
    v6 = off_1E5E4B750;
  }
  else
  {
    if (a4 != 1)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v6 = off_1E5E4B758;
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D82B90]), "initWithData:", v5);
  v8 = (_DWORD *)objc_msgSend(objc_alloc(*v6), "initByReadFrom:", v7);
  v8[10] = a4;

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
  void *v8;
  void *v9;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[16];

  v18[14] = *MEMORY[0x1E0C80C00];
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("absoluteTimestamp"), 3, 0, 1, 0, 1);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("modeIdentifier"), 2, 0, 2, 13, 0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("origin"), 0, 0, 3, 4, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("originBundleID"), 2, 0, 4, 13, 0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isAutomationEnabled"), 0, 0, 5, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isStart"), 0, 0, 6, 12, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("uuid"), 2, 0, 7, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("originAnchorType"), 2, 0, 8, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("uiLocation"), 0, 0, 9, 5, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("confidenceScore"), 1, 0, 10, 0, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("serializedTriggers_json"), 5, 1, &__block_literal_global_136);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("modeType"), 0, 0, 12, 4, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("shouldSuggestTriggers"), 0, 0, 13, 12, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("userModeName"), 2, 0, 14, 13, 0);
  v18[0] = v17;
  v18[1] = v16;
  v18[2] = v15;
  v18[3] = v14;
  v18[4] = v2;
  v18[5] = v3;
  v18[6] = v4;
  v18[7] = v5;
  v18[8] = v6;
  v18[9] = v13;
  v18[10] = v7;
  v18[11] = v12;
  v18[12] = v8;
  v18[13] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 14);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1DCE0;
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
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[16];

  v18[14] = *MEMORY[0x1E0C80C00];
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("absoluteTimestamp"), 1, 0, 0);
  v18[0] = v17;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("modeIdentifier"), 2, 13, 0);
  v18[1] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("origin"), 3, 4, 0);
  v18[2] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("originBundleID"), 4, 13, 0);
  v18[3] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isAutomationEnabled"), 5, 12, 0);
  v18[4] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isStart"), 6, 12, 0);
  v18[5] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("uuid"), 7, 13, 0);
  v18[6] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("originAnchorType"), 8, 13, 0);
  v18[7] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("uiLocation"), 9, 5, 0);
  v18[8] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("confidenceScore"), 10, 0, 0);
  v18[9] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("serializedTriggers"), 11, 14, 0);
  v18[10] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("modeType"), 12, 4, 0);
  v18[11] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("shouldSuggestTriggers"), 13, 12, 0);
  v18[12] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("userModeName"), 14, 13, 0);
  v18[13] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __34__BMUserFocusInferredMode_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_serializedTriggersJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
