@implementation BMMomentsEngagementNotificationInfo

- (BMMomentsEngagementNotificationInfo)initWithNotificationEventTimestamp:(id)a3 notificationPostingTimestamp:(id)a4 notificationSuggestionCount:(id)a5
{
  id v8;
  id v9;
  id v10;
  BMMomentsEngagementNotificationInfo *v11;
  double v12;
  double v13;
  int v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)BMMomentsEngagementNotificationInfo;
  v11 = -[BMEventBase init](&v16, sel_init);
  if (v11)
  {
    v11->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v8)
    {
      v11->_hasRaw_notificationEventTimestamp = 1;
      objc_msgSend(v8, "timeIntervalSince1970");
    }
    else
    {
      v11->_hasRaw_notificationEventTimestamp = 0;
      v12 = -1.0;
    }
    v11->_raw_notificationEventTimestamp = v12;
    if (v9)
    {
      v11->_hasRaw_notificationPostingTimestamp = 1;
      objc_msgSend(v9, "timeIntervalSince1970");
    }
    else
    {
      v11->_hasRaw_notificationPostingTimestamp = 0;
      v13 = -1.0;
    }
    v11->_raw_notificationPostingTimestamp = v13;
    if (v10)
    {
      v11->_hasNotificationSuggestionCount = 1;
      v14 = objc_msgSend(v10, "intValue");
    }
    else
    {
      v11->_hasNotificationSuggestionCount = 0;
      v14 = -1;
    }
    v11->_notificationSuggestionCount = v14;
  }

  return v11;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMMomentsEngagementNotificationInfo notificationEventTimestamp](self, "notificationEventTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEngagementNotificationInfo notificationPostingTimestamp](self, "notificationPostingTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEngagementNotificationInfo notificationSuggestionCount](self, "notificationSuggestionCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMMomentsEngagementNotificationInfo with notificationEventTimestamp: %@, notificationPostingTimestamp: %@, notificationSuggestionCount: %@"), v4, v5, v6);

  return (NSString *)v7;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMomentsEngagementNotificationInfo *v5;
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
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  objc_class *v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  BMMomentsEngagementNotificationInfo *v34;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)BMMomentsEngagementNotificationInfo;
  v5 = -[BMEventBase init](&v36, sel_init);
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
      v20 = v12 >> 3;
      if ((v12 >> 3) == 3)
      {
        v24 = 0;
        v25 = 0;
        v26 = 0;
        v5->_hasNotificationSuggestionCount = 1;
        while (1)
        {
          v27 = *v6;
          v28 = *(_QWORD *)&v4[v27];
          v29 = v28 + 1;
          if (v28 == -1 || v29 > *(_QWORD *)&v4[*v7])
            break;
          v30 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v28);
          *(_QWORD *)&v4[v27] = v29;
          v26 |= (unint64_t)(v30 & 0x7F) << v24;
          if ((v30 & 0x80) == 0)
            goto LABEL_38;
          v24 += 7;
          v17 = v25++ >= 9;
          if (v17)
          {
            LODWORD(v26) = 0;
            goto LABEL_40;
          }
        }
        v4[*v8] = 1;
LABEL_38:
        if (v4[*v8])
          LODWORD(v26) = 0;
LABEL_40:
        v5->_notificationSuggestionCount = v26;
      }
      else
      {
        if ((_DWORD)v20 == 2)
        {
          v5->_hasRaw_notificationPostingTimestamp = 1;
          v31 = *v6;
          v32 = *(_QWORD *)&v4[v31];
          if (v32 <= 0xFFFFFFFFFFFFFFF7 && v32 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v23 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v32);
            *(_QWORD *)&v4[v31] = v32 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v23 = 0;
          }
          v33 = 40;
        }
        else
        {
          if ((_DWORD)v20 != 1)
          {
            if (!PBReaderSkipValueWithTag())
              goto LABEL_48;
            continue;
          }
          v5->_hasRaw_notificationEventTimestamp = 1;
          v21 = *v6;
          v22 = *(_QWORD *)&v4[v21];
          if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v23 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v22);
            *(_QWORD *)&v4[v21] = v22 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v23 = 0;
          }
          v33 = 24;
        }
        *(Class *)((char *)&v5->super.super.isa + v33) = v23;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_48:
    v34 = 0;
  else
LABEL_49:
    v34 = v5;

  return v34;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_hasRaw_notificationEventTimestamp)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasRaw_notificationPostingTimestamp)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasNotificationSuggestionCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMMomentsEngagementNotificationInfo writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMomentsEngagementNotificationInfo)initWithJSONDictionary:(id)a3 error:(id *)p_isa
{
  id v6;
  void *v7;
  void *v8;
  objc_class *v9;
  id v10;
  id v11;
  double v12;
  double v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  objc_class *v18;
  id v19;
  id v20;
  double v21;
  double v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  id v33;
  id *v34;
  id *v35;
  uint64_t v36;
  id v37;
  id v38;
  id *v39;
  id v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("notificationEventTimestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_9:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("notificationPostingTimestamp"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = (objc_class *)MEMORY[0x1E0C99D68];
        v19 = v16;
        v20 = [v18 alloc];
        objc_msgSend(v19, "doubleValue");
        v22 = v21;

        v23 = (id)objc_msgSend(v20, "initWithTimeIntervalSince1970:", v22);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v24 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
          objc_msgSend(v24, "dateFromString:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_17;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!p_isa)
          {
            v17 = 0;
            goto LABEL_22;
          }
          v40 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v35 = p_isa;
          v36 = *MEMORY[0x1E0D025B8];
          v43 = *MEMORY[0x1E0CB2D50];
          v26 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("notificationPostingTimestamp"));
          v44 = v26;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = (id)objc_msgSend(v40, "initWithDomain:code:userInfo:", v36, 2, v25);
          v17 = 0;
          p_isa = 0;
          *v35 = v37;
          goto LABEL_21;
        }
        v23 = v16;
      }
      v17 = v23;
    }
    else
    {
      v17 = 0;
    }
LABEL_17:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("notificationSuggestionCount"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (p_isa)
        {
          v38 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v28 = *MEMORY[0x1E0D025B8];
          v41 = *MEMORY[0x1E0CB2D50];
          v39 = p_isa;
          v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("notificationSuggestionCount"));
          v42 = v29;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *v39 = (id)objc_msgSend(v38, "initWithDomain:code:userInfo:", v28, 2, v30);

          v26 = 0;
          p_isa = 0;
        }
        else
        {
          v26 = 0;
        }
        goto LABEL_21;
      }
      v26 = v25;
    }
    else
    {
      v26 = 0;
    }
    self = -[BMMomentsEngagementNotificationInfo initWithNotificationEventTimestamp:notificationPostingTimestamp:notificationSuggestionCount:](self, "initWithNotificationEventTimestamp:notificationPostingTimestamp:notificationSuggestionCount:", v8, v17, v26);
    p_isa = (id *)&self->super.super.isa;
LABEL_21:

    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = (objc_class *)MEMORY[0x1E0C99D68];
    v10 = v7;
    v11 = [v9 alloc];
    objc_msgSend(v10, "doubleValue");
    v13 = v12;

    v14 = (id)objc_msgSend(v11, "initWithTimeIntervalSince1970:", v13);
LABEL_6:
    v8 = v14;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
    objc_msgSend(v15, "dateFromString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = v7;
    goto LABEL_6;
  }
  if (!p_isa)
  {
    v8 = 0;
    goto LABEL_23;
  }
  v31 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v32 = *MEMORY[0x1E0D025B8];
  v45 = *MEMORY[0x1E0CB2D50];
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("notificationEventTimestamp"));
  v46[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (id)objc_msgSend(v31, "initWithDomain:code:userInfo:", v32, 2, v16);
  v8 = 0;
  v34 = p_isa;
  p_isa = 0;
  *v34 = v33;
LABEL_22:

LABEL_23:
  return (BMMomentsEngagementNotificationInfo *)p_isa;
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
  void *v15;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  -[BMMomentsEngagementNotificationInfo notificationEventTimestamp](self, "notificationEventTimestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEngagementNotificationInfo notificationEventTimestamp](self, "notificationEventTimestamp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSince1970");
    objc_msgSend(v4, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  -[BMMomentsEngagementNotificationInfo notificationPostingTimestamp](self, "notificationPostingTimestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEngagementNotificationInfo notificationPostingTimestamp](self, "notificationPostingTimestamp");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSince1970");
    objc_msgSend(v8, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  if (-[BMMomentsEngagementNotificationInfo hasNotificationSuggestionCount](self, "hasNotificationSuggestionCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEngagementNotificationInfo notificationSuggestionCount](self, "notificationSuggestionCount"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  v17[0] = CFSTR("notificationEventTimestamp");
  v12 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[0] = v12;
  v17[1] = CFSTR("notificationPostingTimestamp");
  v13 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[1] = v13;
  v17[2] = CFSTR("notificationSuggestionCount");
  v14 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (v10)
      goto LABEL_18;
LABEL_21:

    if (v6)
      goto LABEL_19;
LABEL_22:

    goto LABEL_19;
  }

  if (!v10)
    goto LABEL_21;
LABEL_18:
  if (!v6)
    goto LABEL_22;
LABEL_19:

  return v15;
}

- (NSDate)notificationEventTimestamp
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_notificationEventTimestamp)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_notificationEventTimestamp);
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

- (NSDate)notificationPostingTimestamp
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_notificationPostingTimestamp)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_notificationPostingTimestamp);
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
  BOOL v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMMomentsEngagementNotificationInfo notificationEventTimestamp](self, "notificationEventTimestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "notificationEventTimestamp");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMMomentsEngagementNotificationInfo notificationEventTimestamp](self, "notificationEventTimestamp");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "notificationEventTimestamp");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_16;
    }
    -[BMMomentsEngagementNotificationInfo notificationPostingTimestamp](self, "notificationPostingTimestamp");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "notificationPostingTimestamp");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMMomentsEngagementNotificationInfo notificationPostingTimestamp](self, "notificationPostingTimestamp");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "notificationPostingTimestamp");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_16;
    }
    if (!-[BMMomentsEngagementNotificationInfo hasNotificationSuggestionCount](self, "hasNotificationSuggestionCount")
      && !objc_msgSend(v5, "hasNotificationSuggestionCount"))
    {
      v12 = 1;
      goto LABEL_17;
    }
    if (-[BMMomentsEngagementNotificationInfo hasNotificationSuggestionCount](self, "hasNotificationSuggestionCount")
      && objc_msgSend(v5, "hasNotificationSuggestionCount"))
    {
      v19 = -[BMMomentsEngagementNotificationInfo notificationSuggestionCount](self, "notificationSuggestionCount");
      v12 = v19 == objc_msgSend(v5, "notificationSuggestionCount");
LABEL_17:

      goto LABEL_18;
    }
LABEL_16:
    v12 = 0;
    goto LABEL_17;
  }
  v12 = 0;
LABEL_18:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)notificationSuggestionCount
{
  return self->_notificationSuggestionCount;
}

- (BOOL)hasNotificationSuggestionCount
{
  return self->_hasNotificationSuggestionCount;
}

- (void)setHasNotificationSuggestionCount:(BOOL)a3
{
  self->_hasNotificationSuggestionCount = a3;
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

    v4 = -[BMMomentsEngagementNotificationInfo initByReadFrom:]([BMMomentsEngagementNotificationInfo alloc], "initByReadFrom:", v7);
    v4[13] = 0;

  }
  return v4;
}

+ (id)columns
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("notificationEventTimestamp"), 3, 0, 1, 0, 2);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("notificationPostingTimestamp"), 3, 0, 2, 0, 2);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("notificationSuggestionCount"), 0, 0, 3, 2, 0);
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1D608;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("notificationEventTimestamp"), 1, 0, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("notificationPostingTimestamp"), 2, 0, 0, v2);
  v7[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("notificationSuggestionCount"), 3, 2, 0);
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
