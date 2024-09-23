@implementation BMSiriTaskAggregationStatistics

- (BMSiriTaskAggregationStatistics)initWithCompletedSystemTasks:(id)a3 failedSystemTasks:(id)a4 cancelledSystemTasks:(id)a5 tasksPerformedWithUI:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  BMSiriTaskAggregationStatistics *v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)BMSiriTaskAggregationStatistics;
  v14 = -[BMEventBase init](&v20, sel_init);
  if (v14)
  {
    v14->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v10)
    {
      v14->_hasCompletedSystemTasks = 1;
      v15 = objc_msgSend(v10, "unsignedIntValue");
    }
    else
    {
      v15 = 0;
      v14->_hasCompletedSystemTasks = 0;
    }
    v14->_completedSystemTasks = v15;
    if (v11)
    {
      v14->_hasFailedSystemTasks = 1;
      v16 = objc_msgSend(v11, "unsignedIntValue");
    }
    else
    {
      v16 = 0;
      v14->_hasFailedSystemTasks = 0;
    }
    v14->_failedSystemTasks = v16;
    if (v12)
    {
      v14->_hasCancelledSystemTasks = 1;
      v17 = objc_msgSend(v12, "unsignedIntValue");
    }
    else
    {
      v17 = 0;
      v14->_hasCancelledSystemTasks = 0;
    }
    v14->_cancelledSystemTasks = v17;
    if (v13)
    {
      v14->_hasTasksPerformedWithUI = 1;
      v18 = objc_msgSend(v13, "unsignedIntValue");
    }
    else
    {
      v18 = 0;
      v14->_hasTasksPerformedWithUI = 0;
    }
    v14->_tasksPerformedWithUI = v18;
  }

  return v14;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriTaskAggregationStatistics completedSystemTasks](self, "completedSystemTasks"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriTaskAggregationStatistics failedSystemTasks](self, "failedSystemTasks"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriTaskAggregationStatistics cancelledSystemTasks](self, "cancelledSystemTasks"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriTaskAggregationStatistics tasksPerformedWithUI](self, "tasksPerformedWithUI"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSiriTaskAggregationStatistics with completedSystemTasks: %@, failedSystemTasks: %@, cancelledSystemTasks: %@, tasksPerformedWithUI: %@"), v4, v5, v6, v7);

  return (NSString *)v8;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriTaskAggregationStatistics *v5;
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
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  BOOL v27;
  int *v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  char v41;
  unsigned int v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  BMSiriTaskAggregationStatistics *v47;
  objc_super v49;

  v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)BMSiriTaskAggregationStatistics;
  v5 = -[BMEventBase init](&v49, sel_init);
  if (!v5)
    goto LABEL_66;
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
          v20 = 0;
          v21 = 0;
          v22 = 0;
          v5->_hasCompletedSystemTasks = 1;
          while (1)
          {
            v23 = *v6;
            v24 = *(_QWORD *)&v4[v23];
            v25 = v24 + 1;
            if (v24 == -1 || v25 > *(_QWORD *)&v4[*v7])
            {
              v28 = &OBJC_IVAR___BMSiriTaskAggregationStatistics__completedSystemTasks;
              goto LABEL_54;
            }
            v26 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v24);
            *(_QWORD *)&v4[v23] = v25;
            v22 |= (unint64_t)(v26 & 0x7F) << v20;
            if ((v26 & 0x80) == 0)
              break;
            v20 += 7;
            v27 = v21++ > 8;
            if (v27)
            {
              LODWORD(v22) = 0;
              v28 = &OBJC_IVAR___BMSiriTaskAggregationStatistics__completedSystemTasks;
              goto LABEL_57;
            }
          }
          v28 = &OBJC_IVAR___BMSiriTaskAggregationStatistics__completedSystemTasks;
          goto LABEL_55;
        case 2u:
          v29 = 0;
          v30 = 0;
          v22 = 0;
          v5->_hasFailedSystemTasks = 1;
          while (2)
          {
            v31 = *v6;
            v32 = *(_QWORD *)&v4[v31];
            v33 = v32 + 1;
            if (v32 == -1 || v33 > *(_QWORD *)&v4[*v7])
            {
              v28 = &OBJC_IVAR___BMSiriTaskAggregationStatistics__failedSystemTasks;
              goto LABEL_54;
            }
            v34 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v32);
            *(_QWORD *)&v4[v31] = v33;
            v22 |= (unint64_t)(v34 & 0x7F) << v29;
            if (v34 < 0)
            {
              v29 += 7;
              v27 = v30++ > 8;
              if (v27)
              {
                LODWORD(v22) = 0;
                v28 = &OBJC_IVAR___BMSiriTaskAggregationStatistics__failedSystemTasks;
                goto LABEL_57;
              }
              continue;
            }
            break;
          }
          v28 = &OBJC_IVAR___BMSiriTaskAggregationStatistics__failedSystemTasks;
          goto LABEL_55;
        case 3u:
          v35 = 0;
          v36 = 0;
          v22 = 0;
          v5->_hasCancelledSystemTasks = 1;
          while (2)
          {
            v37 = *v6;
            v38 = *(_QWORD *)&v4[v37];
            v39 = v38 + 1;
            if (v38 == -1 || v39 > *(_QWORD *)&v4[*v7])
            {
              v28 = &OBJC_IVAR___BMSiriTaskAggregationStatistics__cancelledSystemTasks;
              goto LABEL_54;
            }
            v40 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v38);
            *(_QWORD *)&v4[v37] = v39;
            v22 |= (unint64_t)(v40 & 0x7F) << v35;
            if (v40 < 0)
            {
              v35 += 7;
              v27 = v36++ > 8;
              if (v27)
              {
                LODWORD(v22) = 0;
                v28 = &OBJC_IVAR___BMSiriTaskAggregationStatistics__cancelledSystemTasks;
                goto LABEL_57;
              }
              continue;
            }
            break;
          }
          v28 = &OBJC_IVAR___BMSiriTaskAggregationStatistics__cancelledSystemTasks;
          goto LABEL_55;
        case 4u:
          v41 = 0;
          v42 = 0;
          v22 = 0;
          v5->_hasTasksPerformedWithUI = 1;
          break;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            goto LABEL_65;
          continue;
      }
      while (1)
      {
        v43 = *v6;
        v44 = *(_QWORD *)&v4[v43];
        v45 = v44 + 1;
        if (v44 == -1 || v45 > *(_QWORD *)&v4[*v7])
          break;
        v46 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v44);
        *(_QWORD *)&v4[v43] = v45;
        v22 |= (unint64_t)(v46 & 0x7F) << v41;
        if ((v46 & 0x80) == 0)
        {
          v28 = &OBJC_IVAR___BMSiriTaskAggregationStatistics__tasksPerformedWithUI;
          goto LABEL_55;
        }
        v41 += 7;
        v27 = v42++ > 8;
        if (v27)
        {
          LODWORD(v22) = 0;
          v28 = &OBJC_IVAR___BMSiriTaskAggregationStatistics__tasksPerformedWithUI;
          goto LABEL_57;
        }
      }
      v28 = &OBJC_IVAR___BMSiriTaskAggregationStatistics__tasksPerformedWithUI;
LABEL_54:
      v4[*v8] = 1;
LABEL_55:
      if (v4[*v8])
        LODWORD(v22) = 0;
LABEL_57:
      *(_DWORD *)((char *)&v5->super.super.isa + *v28) = v22;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_65:
    v47 = 0;
  else
LABEL_66:
    v47 = v5;

  return v47;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_hasCompletedSystemTasks)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasFailedSystemTasks)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasCancelledSystemTasks)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasTasksPerformedWithUI)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSiriTaskAggregationStatistics writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriTaskAggregationStatistics)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  BMSiriTaskAggregationStatistics *v11;
  id v12;
  void *v13;
  id v14;
  BMSiriTaskAggregationStatistics *v15;
  id v16;
  uint64_t v17;
  id *v18;
  id v19;
  id *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v28;
  id v29;
  id v30;
  id *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("completedSystemTasks"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("failedSystemTasks"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v15 = 0;
          goto LABEL_35;
        }
        v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v20 = a4;
        v21 = *MEMORY[0x1E0D025B8];
        v37 = *MEMORY[0x1E0CB2D50];
        v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("failedSystemTasks"));
        v38 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", v21, 2, v10);
        v15 = 0;
        a4 = 0;
        *v20 = v22;
        goto LABEL_33;
      }
      v31 = v9;
    }
    else
    {
      v31 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cancelledSystemTasks"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v12 = 0;
          v15 = 0;
          a4 = v31;
          goto LABEL_34;
        }
        v11 = self;
        v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v23 = *MEMORY[0x1E0D025B8];
        v35 = *MEMORY[0x1E0CB2D50];
        v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("cancelledSystemTasks"));
        v36 = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v23, 2, v13);
        v15 = 0;
        v12 = 0;
        *a4 = v24;
        goto LABEL_31;
      }
      v11 = self;
      v12 = v10;
    }
    else
    {
      v11 = self;
      v12 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tasksPerformedWithUI"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v14 = 0;
LABEL_13:
      a4 = v31;
      v15 = -[BMSiriTaskAggregationStatistics initWithCompletedSystemTasks:failedSystemTasks:cancelledSystemTasks:tasksPerformedWithUI:](v11, "initWithCompletedSystemTasks:failedSystemTasks:cancelledSystemTasks:tasksPerformedWithUI:", v8, v31, v12, v14);
      v11 = v15;
LABEL_32:

      self = v11;
LABEL_33:
      v7 = v32;
LABEL_34:

      goto LABEL_35;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v13;
      goto LABEL_13;
    }
    if (a4)
    {
      v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v28 = *MEMORY[0x1E0D025B8];
      v33 = *MEMORY[0x1E0CB2D50];
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("tasksPerformedWithUI"));
      v34 = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v28, 2, v26);

    }
    v14 = 0;
    v15 = 0;
LABEL_31:
    a4 = v31;
    goto LABEL_32;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v15 = 0;
    v8 = 0;
    goto LABEL_36;
  }
  v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v17 = *MEMORY[0x1E0D025B8];
  v39 = *MEMORY[0x1E0CB2D50];
  v18 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("completedSystemTasks"));
  v40[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v8 = 0;
  *a4 = (id)objc_msgSend(v16, "initWithDomain:code:userInfo:", v17, 2, v9);
  a4 = v18;
LABEL_35:

LABEL_36:
  return v15;
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
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  if (-[BMSiriTaskAggregationStatistics hasCompletedSystemTasks](self, "hasCompletedSystemTasks"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriTaskAggregationStatistics completedSystemTasks](self, "completedSystemTasks"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  if (-[BMSiriTaskAggregationStatistics hasFailedSystemTasks](self, "hasFailedSystemTasks"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriTaskAggregationStatistics failedSystemTasks](self, "failedSystemTasks"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if (-[BMSiriTaskAggregationStatistics hasCancelledSystemTasks](self, "hasCancelledSystemTasks"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriTaskAggregationStatistics cancelledSystemTasks](self, "cancelledSystemTasks"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if (-[BMSiriTaskAggregationStatistics hasTasksPerformedWithUI](self, "hasTasksPerformedWithUI"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriTaskAggregationStatistics tasksPerformedWithUI](self, "tasksPerformedWithUI"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v13[0] = CFSTR("completedSystemTasks");
  v7 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[0] = v7;
  v13[1] = CFSTR("failedSystemTasks");
  v8 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[1] = v8;
  v13[2] = CFSTR("cancelledSystemTasks");
  v9 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[2] = v9;
  v13[3] = CFSTR("tasksPerformedWithUI");
  v10 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (v5)
      goto LABEL_23;
  }
  else
  {

    if (v5)
    {
LABEL_23:
      if (v4)
        goto LABEL_24;
LABEL_28:

      if (v3)
        goto LABEL_25;
LABEL_29:

      goto LABEL_25;
    }
  }

  if (!v4)
    goto LABEL_28;
LABEL_24:
  if (!v3)
    goto LABEL_29;
LABEL_25:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  BOOL v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMSiriTaskAggregationStatistics hasCompletedSystemTasks](self, "hasCompletedSystemTasks")
      || objc_msgSend(v5, "hasCompletedSystemTasks"))
    {
      if (!-[BMSiriTaskAggregationStatistics hasCompletedSystemTasks](self, "hasCompletedSystemTasks"))
        goto LABEL_23;
      if (!objc_msgSend(v5, "hasCompletedSystemTasks"))
        goto LABEL_23;
      v6 = -[BMSiriTaskAggregationStatistics completedSystemTasks](self, "completedSystemTasks");
      if (v6 != objc_msgSend(v5, "completedSystemTasks"))
        goto LABEL_23;
    }
    if (-[BMSiriTaskAggregationStatistics hasFailedSystemTasks](self, "hasFailedSystemTasks")
      || objc_msgSend(v5, "hasFailedSystemTasks"))
    {
      if (!-[BMSiriTaskAggregationStatistics hasFailedSystemTasks](self, "hasFailedSystemTasks"))
        goto LABEL_23;
      if (!objc_msgSend(v5, "hasFailedSystemTasks"))
        goto LABEL_23;
      v7 = -[BMSiriTaskAggregationStatistics failedSystemTasks](self, "failedSystemTasks");
      if (v7 != objc_msgSend(v5, "failedSystemTasks"))
        goto LABEL_23;
    }
    if (-[BMSiriTaskAggregationStatistics hasCancelledSystemTasks](self, "hasCancelledSystemTasks")
      || objc_msgSend(v5, "hasCancelledSystemTasks"))
    {
      if (!-[BMSiriTaskAggregationStatistics hasCancelledSystemTasks](self, "hasCancelledSystemTasks"))
        goto LABEL_23;
      if (!objc_msgSend(v5, "hasCancelledSystemTasks"))
        goto LABEL_23;
      v8 = -[BMSiriTaskAggregationStatistics cancelledSystemTasks](self, "cancelledSystemTasks");
      if (v8 != objc_msgSend(v5, "cancelledSystemTasks"))
        goto LABEL_23;
    }
    if (!-[BMSiriTaskAggregationStatistics hasTasksPerformedWithUI](self, "hasTasksPerformedWithUI")
      && !objc_msgSend(v5, "hasTasksPerformedWithUI"))
    {
      v10 = 1;
      goto LABEL_24;
    }
    if (-[BMSiriTaskAggregationStatistics hasTasksPerformedWithUI](self, "hasTasksPerformedWithUI")
      && objc_msgSend(v5, "hasTasksPerformedWithUI"))
    {
      v9 = -[BMSiriTaskAggregationStatistics tasksPerformedWithUI](self, "tasksPerformedWithUI");
      v10 = v9 == objc_msgSend(v5, "tasksPerformedWithUI");
    }
    else
    {
LABEL_23:
      v10 = 0;
    }
LABEL_24:

    goto LABEL_25;
  }
  v10 = 0;
LABEL_25:

  return v10;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (unsigned)completedSystemTasks
{
  return self->_completedSystemTasks;
}

- (BOOL)hasCompletedSystemTasks
{
  return self->_hasCompletedSystemTasks;
}

- (void)setHasCompletedSystemTasks:(BOOL)a3
{
  self->_hasCompletedSystemTasks = a3;
}

- (unsigned)failedSystemTasks
{
  return self->_failedSystemTasks;
}

- (BOOL)hasFailedSystemTasks
{
  return self->_hasFailedSystemTasks;
}

- (void)setHasFailedSystemTasks:(BOOL)a3
{
  self->_hasFailedSystemTasks = a3;
}

- (unsigned)cancelledSystemTasks
{
  return self->_cancelledSystemTasks;
}

- (BOOL)hasCancelledSystemTasks
{
  return self->_hasCancelledSystemTasks;
}

- (void)setHasCancelledSystemTasks:(BOOL)a3
{
  self->_hasCancelledSystemTasks = a3;
}

- (unsigned)tasksPerformedWithUI
{
  return self->_tasksPerformedWithUI;
}

- (BOOL)hasTasksPerformedWithUI
{
  return self->_hasTasksPerformedWithUI;
}

- (void)setHasTasksPerformedWithUI:(BOOL)a3
{
  self->_hasTasksPerformedWithUI = a3;
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

    v4 = -[BMSiriTaskAggregationStatistics initByReadFrom:]([BMSiriTaskAggregationStatistics alloc], "initByReadFrom:", v7);
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
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("completedSystemTasks"), 0, 0, 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("failedSystemTasks"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("cancelledSystemTasks"), 0, 0, 3, 4, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("tasksPerformedWithUI"), 0, 0, 4, 4, 0);
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1F078;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("completedSystemTasks"), 1, 4, 0);
  v8[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("failedSystemTasks"), 2, 4, 0);
  v8[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("cancelledSystemTasks"), 3, 4, 0);
  v8[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("tasksPerformedWithUI"), 4, 4, 0);
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
