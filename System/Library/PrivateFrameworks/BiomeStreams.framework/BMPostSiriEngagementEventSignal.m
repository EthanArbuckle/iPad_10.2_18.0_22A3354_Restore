@implementation BMPostSiriEngagementEventSignal

- (BMPostSiriEngagementEventSignal)initWithDomain:(id)a3 action:(id)a4 isPostSiriEngagement:(BOOL)a5 pseDelta:(id)a6 pseContentsDictionary:(id)a7
{
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BMPostSiriEngagementEventSignalContent *v19;
  void *v20;
  BMPostSiriEngagementEventSignalContent *v21;
  BMPostSiriEngagementEventSignal *v22;
  _BOOL4 v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v25 = a5;
  v33 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v26 = a4;
  v10 = a6;
  v11 = a7;
  v12 = (void *)objc_opt_new();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v29;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v29 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v17);
        v19 = [BMPostSiriEngagementEventSignalContent alloc];
        objc_msgSend(v13, "objectForKeyedSubscript:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[BMPostSiriEngagementEventSignalContent initWithKey:value:](v19, "initWithKey:value:", v18, v20);

        objc_msgSend(v12, "addObject:", v21);
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v15);
  }

  v22 = -[BMPostSiriEngagementEventSignal initWithDomain:action:isPostSiriEngagement:pseDelta:pseContents:](self, "initWithDomain:action:isPostSiriEngagement:pseDelta:pseContents:", v27, v26, v25, v10, v12);
  return v22;
}

- (BMPostSiriEngagementEventSignal)initWithDomain:(id)a3 action:(id)a4 isPostSiriEngagement:(BOOL)a5 pseDelta:(id)a6 pseContents:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  BMPostSiriEngagementEventSignal *v17;
  BMPostSiriEngagementEventSignal *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)BMPostSiriEngagementEventSignal;
  v17 = -[BMEventBase init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_domain, a3);
    objc_storeStrong((id *)&v18->_action, a4);
    v18->_hasIsPostSiriEngagement = 1;
    v18->_isPostSiriEngagement = a5;
    objc_storeStrong((id *)&v18->_pseDelta, a6);
    objc_storeStrong((id *)&v18->_pseContents, a7);
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

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMPostSiriEngagementEventSignal domain](self, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPostSiriEngagementEventSignal action](self, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPostSiriEngagementEventSignal isPostSiriEngagement](self, "isPostSiriEngagement"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPostSiriEngagementEventSignal pseDelta](self, "pseDelta");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPostSiriEngagementEventSignal pseContents](self, "pseContents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMPostSiriEngagementEventSignal with domain: %@, action: %@, isPostSiriEngagement: %@, pseDelta: %@, pseContents: %@"), v4, v5, v6, v7, v8);

  return (NSString *)v9;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMPostSiriEngagementEventSignal *v5;
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
  uint64_t v22;
  void *v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  BMPostSiriEngagementEventSignalDeltaEvent *v31;
  BMPostSiriEngagementEventSignalDeltaEvent *pseDelta;
  id v33;
  void *v34;
  uint64_t v35;
  NSArray *pseContents;
  int v37;
  BMPostSiriEngagementEventSignal *v38;
  objc_super v40;
  uint64_t v41;
  uint64_t v42;

  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)BMPostSiriEngagementEventSignal;
  v5 = -[BMEventBase init](&v40, sel_init);
  if (!v5)
    goto LABEL_45;
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
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 24;
          goto LABEL_24;
        case 2u:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 32;
LABEL_24:
          v23 = *(Class *)((char *)&v5->super.super.isa + v22);
          *(Class *)((char *)&v5->super.super.isa + v22) = (Class)v21;

          continue;
        case 3u:
          v24 = 0;
          v25 = 0;
          v26 = 0;
          v5->_hasIsPostSiriEngagement = 1;
          break;
        case 4u:
          v41 = 0;
          v42 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_47;
          v31 = -[BMPostSiriEngagementEventSignalDeltaEvent initByReadFrom:]([BMPostSiriEngagementEventSignalDeltaEvent alloc], "initByReadFrom:", v4);
          if (!v31)
            goto LABEL_47;
          pseDelta = v5->_pseDelta;
          v5->_pseDelta = v31;

          PBReaderRecallMark();
          continue;
        case 5u:
          v41 = 0;
          v42 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_47;
          v33 = -[BMPostSiriEngagementEventSignalContent initByReadFrom:]([BMPostSiriEngagementEventSignalContent alloc], "initByReadFrom:", v4);
          if (!v33)
            goto LABEL_47;
          v34 = v33;
          objc_msgSend(v6, "addObject:", v33);
          PBReaderRecallMark();

          continue;
        default:
          if (PBReaderSkipValueWithTag())
            continue;
LABEL_47:

          goto LABEL_44;
      }
      while (1)
      {
        v27 = *v7;
        v28 = *(_QWORD *)&v4[v27];
        v29 = v28 + 1;
        if (v28 == -1 || v29 > *(_QWORD *)&v4[*v8])
          break;
        v30 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v28);
        *(_QWORD *)&v4[v27] = v29;
        v26 |= (unint64_t)(v30 & 0x7F) << v24;
        if ((v30 & 0x80) == 0)
          goto LABEL_39;
        v24 += 7;
        v18 = v25++ >= 9;
        if (v18)
        {
          v26 = 0;
          goto LABEL_41;
        }
      }
      v4[*v9] = 1;
LABEL_39:
      if (v4[*v9])
        v26 = 0;
LABEL_41:
      v5->_isPostSiriEngagement = v26 != 0;
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  v35 = objc_msgSend(v6, "copy");
  pseContents = v5->_pseContents;
  v5->_pseContents = (NSArray *)v35;

  v37 = v4[*v9];
  if (v37)
LABEL_44:
    v38 = 0;
  else
LABEL_45:
    v38 = v5;

  return v38;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_domain)
    PBDataWriterWriteStringField();
  if (self->_action)
    PBDataWriterWriteStringField();
  if (self->_hasIsPostSiriEngagement)
    PBDataWriterWriteBOOLField();
  if (self->_pseDelta)
  {
    v15 = 0;
    PBDataWriterPlaceMark();
    -[BMPostSiriEngagementEventSignalDeltaEvent writeTo:](self->_pseDelta, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_pseContents;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        v15 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v10, "writeTo:", v4, (_QWORD)v11);
        PBDataWriterRecallMark();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v7);
  }

}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v4;
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

    v4 = -[BMPostSiriEngagementEventSignal initByReadFrom:]([BMPostSiriEngagementEventSignal alloc], "initByReadFrom:", v7);
  }
  return v4;
}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMPostSiriEngagementEventSignal writeTo:](self, "writeTo:", v3);
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
  char v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  char v17;
  _BOOL4 v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  char v31;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMPostSiriEngagementEventSignal domain](self, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      v10 = 1;
    }
    else
    {
      -[BMPostSiriEngagementEventSignal domain](self, "domain");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "domain");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
    -[BMPostSiriEngagementEventSignal action](self, "action");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "action");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 == v13)
    {
      v16 = 1;
    }
    else
    {
      -[BMPostSiriEngagementEventSignal action](self, "action");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "action");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isEqual:", v15);

    }
    v31 = v16;
    if (-[BMPostSiriEngagementEventSignal hasIsPostSiriEngagement](self, "hasIsPostSiriEngagement")
      || objc_msgSend(v5, "hasIsPostSiriEngagement"))
    {
      v17 = v10;
      if (-[BMPostSiriEngagementEventSignal hasIsPostSiriEngagement](self, "hasIsPostSiriEngagement")
        && objc_msgSend(v5, "hasIsPostSiriEngagement"))
      {
        v18 = -[BMPostSiriEngagementEventSignal isPostSiriEngagement](self, "isPostSiriEngagement");
        v19 = v18 ^ objc_msgSend(v5, "isPostSiriEngagement") ^ 1;
      }
      else
      {
        LOBYTE(v19) = 0;
      }
    }
    else
    {
      v17 = v10;
      LOBYTE(v19) = 1;
    }
    -[BMPostSiriEngagementEventSignal pseDelta](self, "pseDelta");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pseDelta");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20 == v21)
    {
      v24 = 1;
    }
    else
    {
      -[BMPostSiriEngagementEventSignal pseDelta](self, "pseDelta");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pseDelta");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

    }
    -[BMPostSiriEngagementEventSignal pseContents](self, "pseContents");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pseContents");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25 == v26)
    {
      v29 = 1;
    }
    else
    {
      -[BMPostSiriEngagementEventSignal pseContents](self, "pseContents");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pseContents");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v27, "isEqual:", v28);

    }
    v11 = v17 & v31 & v19 & v24 & v29;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)action
{
  return self->_action;
}

- (BOOL)hasIsPostSiriEngagement
{
  return self->_hasIsPostSiriEngagement;
}

- (void)setHasIsPostSiriEngagement:(BOOL)a3
{
  self->_hasIsPostSiriEngagement = a3;
}

- (BOOL)isPostSiriEngagement
{
  return self->_isPostSiriEngagement;
}

- (BMPostSiriEngagementEventSignalDeltaEvent)pseDelta
{
  return self->_pseDelta;
}

- (NSArray)pseContents
{
  return self->_pseContents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pseContents, 0);
  objc_storeStrong((id *)&self->_pseDelta, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
