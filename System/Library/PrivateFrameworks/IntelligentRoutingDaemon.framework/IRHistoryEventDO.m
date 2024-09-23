@implementation IRHistoryEventDO

- (IRHistoryEventDO)initWithDate:(id)a3 candidateIdentifier:(id)a4 event:(id)a5 miloPredictionEvent:(id)a6 systemState:(id)a7 sharingPolicy:(id)a8
{
  id v15;
  id v16;
  id v17;
  IRHistoryEventDO *v18;
  IRHistoryEventDO *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)IRHistoryEventDO;
  v18 = -[IRHistoryEventDO init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_date, a3);
    objc_storeStrong((id *)&v19->_candidateIdentifier, a4);
    objc_storeStrong((id *)&v19->_event, a5);
    objc_storeStrong((id *)&v19->_miloPredictionEvent, a6);
    objc_storeStrong((id *)&v19->_systemState, a7);
    objc_storeStrong((id *)&v19->_sharingPolicy, a8);
  }

  return v19;
}

+ (id)historyEventDOWithDate:(id)a3 candidateIdentifier:(id)a4 event:(id)a5 miloPredictionEvent:(id)a6 systemState:(id)a7 sharingPolicy:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDate:candidateIdentifier:event:miloPredictionEvent:systemState:sharingPolicy:", v19, v18, v17, v16, v15, v14);

  return v20;
}

- (id)copyWithReplacementDate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDate:candidateIdentifier:event:miloPredictionEvent:systemState:sharingPolicy:", v4, self->_candidateIdentifier, self->_event, self->_miloPredictionEvent, self->_systemState, self->_sharingPolicy);

  return v5;
}

- (id)copyWithReplacementCandidateIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDate:candidateIdentifier:event:miloPredictionEvent:systemState:sharingPolicy:", self->_date, v4, self->_event, self->_miloPredictionEvent, self->_systemState, self->_sharingPolicy);

  return v5;
}

- (id)copyWithReplacementEvent:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDate:candidateIdentifier:event:miloPredictionEvent:systemState:sharingPolicy:", self->_date, self->_candidateIdentifier, v4, self->_miloPredictionEvent, self->_systemState, self->_sharingPolicy);

  return v5;
}

- (id)copyWithReplacementMiloPredictionEvent:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDate:candidateIdentifier:event:miloPredictionEvent:systemState:sharingPolicy:", self->_date, self->_candidateIdentifier, self->_event, v4, self->_systemState, self->_sharingPolicy);

  return v5;
}

- (id)copyWithReplacementSystemState:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDate:candidateIdentifier:event:miloPredictionEvent:systemState:sharingPolicy:", self->_date, self->_candidateIdentifier, self->_event, self->_miloPredictionEvent, v4, self->_sharingPolicy);

  return v5;
}

- (id)copyWithReplacementSharingPolicy:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDate:candidateIdentifier:event:miloPredictionEvent:systemState:sharingPolicy:", self->_date, self->_candidateIdentifier, self->_event, self->_miloPredictionEvent, self->_systemState, v4);

  return v5;
}

- (BOOL)isEqualToHistoryEventDO:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSDate *date;
  void *v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  NSString *candidateIdentifier;
  void *v16;
  int v17;
  int v18;
  void *v19;
  int v20;
  IREventDO *event;
  void *v22;
  _BOOL4 v23;
  int v24;
  void *v25;
  int v26;
  IRMiLoPredictionEventDO *miloPredictionEvent;
  void *v28;
  _BOOL4 v29;
  int v30;
  void *v31;
  int v32;
  IRSystemStateDO *systemState;
  void *v34;
  _BOOL4 v35;
  int v36;
  void *v37;
  int v38;
  NSString *sharingPolicy;
  void *v40;
  char v41;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_20;
  v6 = self->_date != 0;
  objc_msgSend(v4, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_20;
  date = self->_date;
  if (date)
  {
    objc_msgSend(v5, "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSDate isEqual:](date, "isEqual:", v10);

    if (!v11)
      goto LABEL_20;
  }
  v12 = self->_candidateIdentifier != 0;
  objc_msgSend(v5, "candidateIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v12 == v14)
    goto LABEL_20;
  candidateIdentifier = self->_candidateIdentifier;
  if (candidateIdentifier)
  {
    objc_msgSend(v5, "candidateIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[NSString isEqual:](candidateIdentifier, "isEqual:", v16);

    if (!v17)
      goto LABEL_20;
  }
  v18 = self->_event != 0;
  objc_msgSend(v5, "event");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 == 0;

  if (v18 == v20)
    goto LABEL_20;
  event = self->_event;
  if (event)
  {
    objc_msgSend(v5, "event");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[IREventDO isEqual:](event, "isEqual:", v22);

    if (!v23)
      goto LABEL_20;
  }
  v24 = self->_miloPredictionEvent != 0;
  objc_msgSend(v5, "miloPredictionEvent");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25 == 0;

  if (v24 == v26)
    goto LABEL_20;
  miloPredictionEvent = self->_miloPredictionEvent;
  if (miloPredictionEvent)
  {
    objc_msgSend(v5, "miloPredictionEvent");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[IRMiLoPredictionEventDO isEqual:](miloPredictionEvent, "isEqual:", v28);

    if (!v29)
      goto LABEL_20;
  }
  v30 = self->_systemState != 0;
  objc_msgSend(v5, "systemState");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31 == 0;

  if (v30 == v32)
    goto LABEL_20;
  systemState = self->_systemState;
  if (systemState)
  {
    objc_msgSend(v5, "systemState");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[IRSystemStateDO isEqual:](systemState, "isEqual:", v34);

    if (!v35)
      goto LABEL_20;
  }
  v36 = self->_sharingPolicy != 0;
  objc_msgSend(v5, "sharingPolicy");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37 == 0;

  if (v36 == v38)
  {
LABEL_20:
    v41 = 0;
  }
  else
  {
    sharingPolicy = self->_sharingPolicy;
    if (sharingPolicy)
    {
      objc_msgSend(v5, "sharingPolicy");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = -[NSString isEqual:](sharingPolicy, "isEqual:", v40);

    }
    else
    {
      v41 = 1;
    }
  }

  return v41;
}

- (BOOL)isEqual:(id)a3
{
  IRHistoryEventDO *v4;
  IRHistoryEventDO *v5;
  BOOL v6;

  v4 = (IRHistoryEventDO *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[IRHistoryEventDO isEqualToHistoryEventDO:](self, "isEqualToHistoryEventDO:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = -[NSDate hash](self->_date, "hash");
  v4 = -[NSString hash](self->_candidateIdentifier, "hash") - v3 + 32 * v3;
  v5 = -[IREventDO hash](self->_event, "hash") - v4 + 32 * v4;
  v6 = -[IRMiLoPredictionEventDO hash](self->_miloPredictionEvent, "hash") - v5 + 32 * v5;
  v7 = -[IRSystemStateDO hash](self->_systemState, "hash") - v6 + 32 * v6;
  return -[NSString hash](self->_sharingPolicy, "hash") - v7 + 32 * v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IRHistoryEventDO)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  IRHistoryEventDO *v14;
  objc_class *v15;
  objc_class *v16;
  void *v17;
  void *v19;
  objc_class *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IRHistoryEventDO key \"date\" (expected %@, decoded %@)"), v7, v9, 0);
      v35 = *MEMORY[0x24BDD0FC8];
      v36[0] = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRHistoryEventDOOCNTErrorDomain"), 3, v11);
      objc_msgSend(v4, "failWithError:", v12);
LABEL_9:
      v14 = 0;
LABEL_10:

LABEL_11:
LABEL_12:

LABEL_13:
LABEL_14:

      goto LABEL_15;
    }
LABEL_6:
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("candidateIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IRHistoryEventDO key \"candidateIdentifier\" (expected %@, decoded %@)"), v9, v10, 0);
        v33 = *MEMORY[0x24BDD0FC8];
        v34 = v11;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRHistoryEventDOOCNTErrorDomain"), 3, v12);
        objc_msgSend(v4, "failWithError:", v17);

        goto LABEL_9;
      }
    }
    else
    {
      objc_msgSend(v4, "error");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        v14 = 0;
        goto LABEL_14;
      }
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("event"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(v4, "error");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        v14 = 0;
        goto LABEL_13;
      }
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("miloPredictionEvent"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(v4, "error");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        v14 = 0;
        goto LABEL_12;
      }
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("systemState"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(v4, "error");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        v14 = 0;
        goto LABEL_11;
      }
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharingPolicy"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IRHistoryEventDO key \"sharingPolicy\" (expected %@, decoded %@)"), v30, v29, 0);
        v31 = *MEMORY[0x24BDD0FC8];
        v32 = v28;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRHistoryEventDOOCNTErrorDomain"), 3, v22);
        objc_msgSend(v4, "failWithError:", v23);

        goto LABEL_9;
      }
    }
    else
    {
      objc_msgSend(v4, "error");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
        goto LABEL_9;
    }
    self = -[IRHistoryEventDO initWithDate:candidateIdentifier:event:miloPredictionEvent:systemState:sharingPolicy:](self, "initWithDate:candidateIdentifier:event:miloPredictionEvent:systemState:sharingPolicy:", v5, v7, v9, v10, v11, v12);
    v14 = self;
    goto LABEL_10;
  }
  objc_msgSend(v4, "error");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    goto LABEL_6;
  v14 = 0;
LABEL_15:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSDate *date;
  NSString *candidateIdentifier;
  IREventDO *event;
  IRMiLoPredictionEventDO *miloPredictionEvent;
  IRSystemStateDO *systemState;
  NSString *sharingPolicy;
  id v11;

  v4 = a3;
  date = self->_date;
  v11 = v4;
  if (date)
  {
    objc_msgSend(v4, "encodeObject:forKey:", date, CFSTR("date"));
    v4 = v11;
  }
  candidateIdentifier = self->_candidateIdentifier;
  if (candidateIdentifier)
  {
    objc_msgSend(v11, "encodeObject:forKey:", candidateIdentifier, CFSTR("candidateIdentifier"));
    v4 = v11;
  }
  event = self->_event;
  if (event)
  {
    objc_msgSend(v11, "encodeObject:forKey:", event, CFSTR("event"));
    v4 = v11;
  }
  miloPredictionEvent = self->_miloPredictionEvent;
  if (miloPredictionEvent)
  {
    objc_msgSend(v11, "encodeObject:forKey:", miloPredictionEvent, CFSTR("miloPredictionEvent"));
    v4 = v11;
  }
  systemState = self->_systemState;
  if (systemState)
  {
    objc_msgSend(v11, "encodeObject:forKey:", systemState, CFSTR("systemState"));
    v4 = v11;
  }
  sharingPolicy = self->_sharingPolicy;
  if (sharingPolicy)
  {
    objc_msgSend(v11, "encodeObject:forKey:", sharingPolicy, CFSTR("sharingPolicy"));
    v4 = v11;
  }

}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("<IRHistoryEventDO | date:%@ candidateIdentifier:%@ event:%@ miloPredictionEvent:%@ systemState:%@ sharingPolicy:%@>"), self->_date, self->_candidateIdentifier, self->_event, self->_miloPredictionEvent, self->_systemState, self->_sharingPolicy);
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)candidateIdentifier
{
  return self->_candidateIdentifier;
}

- (IREventDO)event
{
  return self->_event;
}

- (IRMiLoPredictionEventDO)miloPredictionEvent
{
  return self->_miloPredictionEvent;
}

- (IRSystemStateDO)systemState
{
  return self->_systemState;
}

- (NSString)sharingPolicy
{
  return self->_sharingPolicy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingPolicy, 0);
  objc_storeStrong((id *)&self->_systemState, 0);
  objc_storeStrong((id *)&self->_miloPredictionEvent, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_candidateIdentifier, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
