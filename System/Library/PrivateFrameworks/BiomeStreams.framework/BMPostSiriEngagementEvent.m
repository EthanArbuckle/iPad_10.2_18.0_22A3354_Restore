@implementation BMPostSiriEngagementEvent

- (BMPostSiriEngagementEvent)initWithUISessionID:(id)a3 taskID:(id)a4 taskType:(id)a5 conversationPath:(id)a6 taskSuccess:(int)a7 isUserAbandoned:(BOOL)a8 isUserCancelled:(BOOL)a9 pseEvents:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  BMPostSiriEngagementEvent *v19;
  BMPostSiriEngagementEvent *v20;
  id v24;
  objc_super v25;

  v15 = a3;
  v16 = a4;
  v24 = a5;
  v17 = a6;
  v18 = a10;
  v25.receiver = self;
  v25.super_class = (Class)BMPostSiriEngagementEvent;
  v19 = -[BMEventBase init](&v25, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_UISessionID, a3);
    objc_storeStrong((id *)&v20->_taskID, a4);
    objc_storeStrong((id *)&v20->_taskType, a5);
    objc_storeStrong((id *)&v20->_conversationPath, a6);
    v20->_hasTaskSuccess = 1;
    v20->_taskSuccess = a7;
    v20->_hasIsUserAbandoned = 1;
    v20->_isUserAbandoned = a8;
    v20->_hasIsUserCancelled = 1;
    v20->_isUserCancelled = a9;
    objc_storeStrong((id *)&v20->_pseEvents, a10);
  }

  return v20;
}

- (BMPostSiriEngagementEvent)initWithUISessionId:(id)a3 domain:(id)a4 action:(id)a5 isPostSiriEngagement:(BOOL)a6 pseDeltaDuration:(double)a7 pseDeltaSinceUIStart:(double)a8 pseDeltaSinceUIEnd:(double)a9 pseContents:(id)a10
{
  _BOOL4 v14;
  id v19;
  id v20;
  id v21;
  id v22;
  BMPostSiriEngagementEvent *v23;
  BMPostSiriEngagementEvent *v24;
  NSString *taskID;
  NSString *taskType;
  NSString *conversationPath;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  BMPostSiriEngagementEventSignalContent *v35;
  void *v36;
  BMPostSiriEngagementEventSignalContent *v37;
  BMPostSiriEngagementEventSignal *v38;
  uint64_t v39;
  NSArray *pseEvents;
  BMPostSiriEngagementEventSignalDeltaEvent *v42;
  _BOOL4 v43;
  id v44;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  objc_super v51;
  BMPostSiriEngagementEventSignal *v52;
  _BYTE v53[128];
  uint64_t v54;

  v14 = a6;
  v54 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = a10;
  v51.receiver = self;
  v51.super_class = (Class)BMPostSiriEngagementEvent;
  v23 = -[BMEventBase init](&v51, sel_init);
  v24 = v23;
  if (v23)
  {
    v43 = v14;
    v44 = v21;
    v45 = v20;
    v46 = v19;
    objc_storeStrong((id *)&v23->_UISessionID, a3);
    taskID = v24->_taskID;
    v24->_taskID = 0;

    taskType = v24->_taskType;
    v24->_taskType = 0;

    conversationPath = v24->_conversationPath;
    v24->_conversationPath = 0;

    v24->_hasTaskSuccess = 0;
    v24->_hasIsUserAbandoned = 0;
    v24->_hasIsUserCancelled = 0;
    v42 = -[BMPostSiriEngagementEventSignalDeltaEvent initWithDuration:sinceUIEnd:sinceUIStart:]([BMPostSiriEngagementEventSignalDeltaEvent alloc], "initWithDuration:sinceUIEnd:sinceUIStart:", a7, a9, a8);
    v28 = (void *)objc_opt_new();
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v29 = v22;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v48 != v32)
            objc_enumerationMutation(v29);
          v34 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
          v35 = [BMPostSiriEngagementEventSignalContent alloc];
          objc_msgSend(v29, "objectForKeyedSubscript:", v34);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = -[BMPostSiriEngagementEventSignalContent initWithKey:value:](v35, "initWithKey:value:", v34, v36);

          objc_msgSend(v28, "addObject:", v37);
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
      }
      while (v31);
    }

    v21 = v44;
    v20 = v45;
    v38 = -[BMPostSiriEngagementEventSignal initWithDomain:action:isPostSiriEngagement:pseDelta:pseContents:]([BMPostSiriEngagementEventSignal alloc], "initWithDomain:action:isPostSiriEngagement:pseDelta:pseContents:", v45, v44, v43, v42, v28);
    v52 = v38;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
    v39 = objc_claimAutoreleasedReturnValue();
    pseEvents = v24->_pseEvents;
    v24->_pseEvents = (NSArray *)v39;

    v19 = v46;
  }

  return v24;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMPostSiriEngagementEvent UISessionID](self, "UISessionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPostSiriEngagementEvent taskID](self, "taskID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPostSiriEngagementEvent taskType](self, "taskType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPostSiriEngagementEvent conversationPath](self, "conversationPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[BMPostSiriEngagementEvent taskSuccess](self, "taskSuccess");
  if (v8 >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_1E2648860[(int)v8];
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPostSiriEngagementEvent isUserAbandoned](self, "isUserAbandoned"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPostSiriEngagementEvent isUserCancelled](self, "isUserCancelled"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPostSiriEngagementEvent pseEvents](self, "pseEvents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMPostSiriEngagementEvent with UISessionID: %@, taskID: %@, taskType: %@, conversationPath: %@, taskSuccess: %@, isUserAbandoned: %@, isUserCancelled: %@, pseEvents: %@"), v4, v5, v6, v7, v9, v10, v11, v12);

  return (NSString *)v13;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMPostSiriEngagementEvent *v5;
  void *v6;
  int *v7;
  int *v8;
  int *v9;
  int *v10;
  int *v11;
  int *v12;
  char v13;
  unsigned int v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  BOOL v20;
  int v21;
  uint64_t v23;
  uint64_t v24;
  void *v25;
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
  int *v47;
  int *v48;
  id v49;
  void *v50;
  BOOL v51;
  uint64_t v52;
  uint64_t v53;
  NSArray *pseEvents;
  int v55;
  BMPostSiriEngagementEvent *v56;
  objc_super v58;
  uint64_t v59;
  uint64_t v60;

  v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)BMPostSiriEngagementEvent;
  v5 = -[BMEventBase init](&v58, sel_init);
  if (!v5)
    goto LABEL_67;
  v6 = (void *)objc_opt_new();
  v7 = (int *)MEMORY[0x1E0D82BF0];
  v8 = (int *)MEMORY[0x1E0D82BD8];
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v10 = &OBJC_IVAR___BMPBMessagesContentEvent__recipients;
    v11 = &OBJC_IVAR___BMPBMessagesContentEvent__recipients;
    v12 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v9])
        break;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      while (1)
      {
        v16 = *v7;
        v17 = *(_QWORD *)&v4[v16];
        v18 = v17 + 1;
        if (v17 == -1 || v18 > *(_QWORD *)&v4[*v8])
          break;
        v19 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v17);
        *(_QWORD *)&v4[v16] = v18;
        v15 |= (unint64_t)(v19 & 0x7F) << v13;
        if ((v19 & 0x80) == 0)
          goto LABEL_13;
        v13 += 7;
        v20 = v14++ >= 9;
        if (v20)
        {
          v15 = 0;
          v21 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      v21 = v4[*v9];
      if (v4[*v9])
        v15 = 0;
LABEL_15:
      if (v21 || (v15 & 7) == 4)
        break;
      switch((v15 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = v10[419];
          goto LABEL_26;
        case 2u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = v11[420];
          goto LABEL_26;
        case 3u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 48;
          goto LABEL_26;
        case 4u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 56;
LABEL_26:
          v25 = *(Class *)((char *)&v5->super.super.isa + v24);
          *(Class *)((char *)&v5->super.super.isa + v24) = (Class)v23;

          continue;
        case 5u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          v5->_hasTaskSuccess = 1;
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
              v32 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v30);
              *(_QWORD *)&v4[v29] = v31;
              v28 |= (unint64_t)(v32 & 0x7F) << v26;
              if (v32 < 0)
              {
                v26 += 7;
                v20 = v27++ >= 9;
                if (v20)
                {
                  LODWORD(v28) = 0;
                  goto LABEL_54;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            LODWORD(v28) = 0;
LABEL_54:
          v5->_taskSuccess = v28;
          continue;
        case 6u:
          v33 = 0;
          v34 = 0;
          v35 = 0;
          v5->_hasIsUserAbandoned = 1;
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
              v39 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v37);
              *(_QWORD *)&v4[v36] = v38;
              v35 |= (unint64_t)(v39 & 0x7F) << v33;
              if (v39 < 0)
              {
                v33 += 7;
                v20 = v34++ >= 9;
                if (v20)
                {
                  v35 = 0;
                  goto LABEL_58;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            v35 = 0;
LABEL_58:
          v51 = v35 != 0;
          v52 = 18;
          goto LABEL_63;
        case 7u:
          v40 = 0;
          v41 = 0;
          v42 = 0;
          v5->_hasIsUserCancelled = 1;
          break;
        case 8u:
          v59 = 0;
          v60 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_69;
          v47 = v11;
          v48 = v10;
          v49 = -[BMPostSiriEngagementEventSignal initByReadFrom:]([BMPostSiriEngagementEventSignal alloc], "initByReadFrom:", v4);
          if (!v49)
            goto LABEL_69;
          v50 = v49;
          objc_msgSend(v6, "addObject:", v49);
          PBReaderRecallMark();

          v10 = v48;
          v11 = v47;
          continue;
        default:
          if (PBReaderSkipValueWithTag())
            continue;
LABEL_69:

          goto LABEL_66;
      }
      while (1)
      {
        v43 = *v7;
        v44 = *(_QWORD *)&v4[v43];
        v45 = v44 + 1;
        if (v44 == -1 || v45 > *(_QWORD *)&v4[*v8])
          break;
        v46 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v44);
        *(_QWORD *)&v4[v43] = v45;
        v42 |= (unint64_t)(v46 & 0x7F) << v40;
        if ((v46 & 0x80) == 0)
          goto LABEL_60;
        v40 += 7;
        v20 = v41++ >= 9;
        if (v20)
        {
          v42 = 0;
          goto LABEL_62;
        }
      }
      v4[*v9] = 1;
LABEL_60:
      if (v4[*v9])
        v42 = 0;
LABEL_62:
      v51 = v42 != 0;
      v52 = 20;
LABEL_63:
      *((_BYTE *)&v5->super.super.isa + v52) = v51;
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  v53 = objc_msgSend(v6, "copy");
  pseEvents = v5->_pseEvents;
  v5->_pseEvents = (NSArray *)v53;

  v55 = v4[*v9];
  if (v55)
LABEL_66:
    v56 = 0;
  else
LABEL_67:
    v56 = v5;

  return v56;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_UISessionID)
    PBDataWriterWriteStringField();
  if (self->_taskID)
    PBDataWriterWriteStringField();
  if (self->_taskType)
    PBDataWriterWriteStringField();
  if (self->_conversationPath)
    PBDataWriterWriteStringField();
  if (self->_hasTaskSuccess)
    PBDataWriterWriteUint32Field();
  if (self->_hasIsUserAbandoned)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsUserCancelled)
    PBDataWriterWriteBOOLField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_pseEvents;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        PBDataWriterPlaceMark();
        objc_msgSend(v10, "writeTo:", v4);
        PBDataWriterRecallMark();
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;

  if (a4 == 1)
  {
    v4 = (objc_class *)MEMORY[0x1E0D82B90];
    v5 = a3;
    v6 = (void *)objc_msgSend([v4 alloc], "initWithData:", v5);

    v7 = -[BMPostSiriEngagementEvent initByReadFrom:]([BMPostSiriEngagementEvent alloc], "initByReadFrom:", v6);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMPostSiriEngagementEvent writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  int v27;
  BOOL v28;
  _BOOL4 v29;
  int v30;
  _BOOL4 v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  char v37;
  BOOL v38;
  void *v39;
  char v40;
  uint64_t v42;
  char v43;
  char v44;
  char v45;
  char v46;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMPostSiriEngagementEvent UISessionID](self, "UISessionID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UISessionID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      v10 = 1;
    }
    else
    {
      -[BMPostSiriEngagementEvent UISessionID](self, "UISessionID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "UISessionID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
    -[BMPostSiriEngagementEvent taskID](self, "taskID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "taskID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 == v13)
    {
      v16 = 1;
    }
    else
    {
      -[BMPostSiriEngagementEvent taskID](self, "taskID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "taskID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isEqual:", v15);

    }
    -[BMPostSiriEngagementEvent taskType](self, "taskType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "taskType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17 == v18)
    {
      v21 = 1;
    }
    else
    {
      -[BMPostSiriEngagementEvent taskType](self, "taskType");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "taskType");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "isEqual:", v20);

    }
    -[BMPostSiriEngagementEvent conversationPath](self, "conversationPath");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "conversationPath");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v42) = v10;
    if (v22 == v23)
    {
      v26 = 1;
    }
    else
    {
      -[BMPostSiriEngagementEvent conversationPath](self, "conversationPath");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "conversationPath");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "isEqual:", v25);

    }
    v46 = v16;
    if (-[BMPostSiriEngagementEvent hasTaskSuccess](self, "hasTaskSuccess")
      || objc_msgSend(v5, "hasTaskSuccess"))
    {
      if (-[BMPostSiriEngagementEvent hasTaskSuccess](self, "hasTaskSuccess", v42)
        && objc_msgSend(v5, "hasTaskSuccess"))
      {
        v27 = -[BMPostSiriEngagementEvent taskSuccess](self, "taskSuccess");
        v28 = v27 == objc_msgSend(v5, "taskSuccess");
      }
      else
      {
        v28 = 0;
      }
    }
    else
    {
      v28 = 1;
    }
    v45 = v21;
    if (-[BMPostSiriEngagementEvent hasIsUserAbandoned](self, "hasIsUserAbandoned", v42)
      || objc_msgSend(v5, "hasIsUserAbandoned"))
    {
      if (-[BMPostSiriEngagementEvent hasIsUserAbandoned](self, "hasIsUserAbandoned")
        && objc_msgSend(v5, "hasIsUserAbandoned"))
      {
        v29 = -[BMPostSiriEngagementEvent isUserAbandoned](self, "isUserAbandoned");
        v30 = v29 ^ objc_msgSend(v5, "isUserAbandoned") ^ 1;
      }
      else
      {
        LOBYTE(v30) = 0;
      }
    }
    else
    {
      LOBYTE(v30) = 1;
    }
    v44 = v26;
    if (-[BMPostSiriEngagementEvent hasIsUserCancelled](self, "hasIsUserCancelled")
      || objc_msgSend(v5, "hasIsUserCancelled"))
    {
      if (-[BMPostSiriEngagementEvent hasIsUserCancelled](self, "hasIsUserCancelled")
        && objc_msgSend(v5, "hasIsUserCancelled"))
      {
        v31 = -[BMPostSiriEngagementEvent isUserCancelled](self, "isUserCancelled");
        v32 = v31 ^ objc_msgSend(v5, "isUserCancelled") ^ 1;
      }
      else
      {
        LOBYTE(v32) = 0;
      }
    }
    else
    {
      LOBYTE(v32) = 1;
    }
    -[BMPostSiriEngagementEvent pseEvents](self, "pseEvents");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pseEvents");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33 == v34)
    {
      v40 = 1;
    }
    else
    {
      -[BMPostSiriEngagementEvent pseEvents](self, "pseEvents");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pseEvents");
      v36 = v4;
      v37 = v30;
      v38 = v28;
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v35, "isEqual:", v39);

      v28 = v38;
      LOBYTE(v30) = v37;
      v4 = v36;

    }
    v11 = v43 & v46 & v45 & v44 & v28 & v30 & v32 & v40;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSString)UISessionID
{
  return self->_UISessionID;
}

- (NSString)taskID
{
  return self->_taskID;
}

- (NSString)taskType
{
  return self->_taskType;
}

- (NSString)conversationPath
{
  return self->_conversationPath;
}

- (BOOL)hasTaskSuccess
{
  return self->_hasTaskSuccess;
}

- (void)setHasTaskSuccess:(BOOL)a3
{
  self->_hasTaskSuccess = a3;
}

- (int)taskSuccess
{
  return self->_taskSuccess;
}

- (BOOL)hasIsUserAbandoned
{
  return self->_hasIsUserAbandoned;
}

- (void)setHasIsUserAbandoned:(BOOL)a3
{
  self->_hasIsUserAbandoned = a3;
}

- (BOOL)isUserAbandoned
{
  return self->_isUserAbandoned;
}

- (BOOL)hasIsUserCancelled
{
  return self->_hasIsUserCancelled;
}

- (void)setHasIsUserCancelled:(BOOL)a3
{
  self->_hasIsUserCancelled = a3;
}

- (BOOL)isUserCancelled
{
  return self->_isUserCancelled;
}

- (NSArray)pseEvents
{
  return self->_pseEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pseEvents, 0);
  objc_storeStrong((id *)&self->_conversationPath, 0);
  objc_storeStrong((id *)&self->_taskType, 0);
  objc_storeStrong((id *)&self->_taskID, 0);
  objc_storeStrong((id *)&self->_UISessionID, 0);
}

@end
