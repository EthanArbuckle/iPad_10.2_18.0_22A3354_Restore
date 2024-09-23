@implementation IRReplayEventDO

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearbyDeviceContainerDO, 0);
  objc_storeStrong((id *)&self->_systemState, 0);
  objc_storeStrong((id *)&self->_miloLslPrediction, 0);
  objc_storeStrong((id *)&self->_candidatesContainer, 0);
  objc_storeStrong((id *)&self->_contextChangeReason, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

- (IRReplayEventDO)initWithDate:(id)a3 contextChangeReason:(id)a4 candidatesContainer:(id)a5 miloLslPrediction:(id)a6 systemState:(id)a7 nearbyDeviceContainerDO:(id)a8
{
  id v15;
  id v16;
  id v17;
  IRReplayEventDO *v18;
  IRReplayEventDO *v19;
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
  v24.super_class = (Class)IRReplayEventDO;
  v18 = -[IRReplayEventDO init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_date, a3);
    objc_storeStrong((id *)&v19->_contextChangeReason, a4);
    objc_storeStrong((id *)&v19->_candidatesContainer, a5);
    objc_storeStrong((id *)&v19->_miloLslPrediction, a6);
    objc_storeStrong((id *)&v19->_systemState, a7);
    objc_storeStrong((id *)&v19->_nearbyDeviceContainerDO, a8);
  }

  return v19;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = -[NSDate hash](self->_date, "hash");
  v4 = -[NSString hash](self->_contextChangeReason, "hash") - v3 + 32 * v3;
  v5 = -[IRCandidatesContainerDO hash](self->_candidatesContainer, "hash") - v4 + 32 * v4;
  v6 = -[IRMiloLslPredictionDO hash](self->_miloLslPrediction, "hash") - v5 + 32 * v5;
  v7 = -[IRSystemStateDO hash](self->_systemState, "hash") - v6 + 32 * v6;
  return -[IRNearbyDeviceContainerDO hash](self->_nearbyDeviceContainerDO, "hash") - v7 + 32 * v7;
}

- (NSDate)date
{
  return self->_date;
}

- (IRSystemStateDO)systemState
{
  return self->_systemState;
}

- (IRNearbyDeviceContainerDO)nearbyDeviceContainerDO
{
  return self->_nearbyDeviceContainerDO;
}

- (IRMiloLslPredictionDO)miloLslPrediction
{
  return self->_miloLslPrediction;
}

- (NSString)contextChangeReason
{
  return self->_contextChangeReason;
}

- (IRCandidatesContainerDO)candidatesContainer
{
  return self->_candidatesContainer;
}

- (BOOL)isEqualToReplayEventDO:(id)a3
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
  NSString *contextChangeReason;
  void *v16;
  int v17;
  int v18;
  void *v19;
  int v20;
  IRCandidatesContainerDO *candidatesContainer;
  void *v22;
  _BOOL4 v23;
  int v24;
  void *v25;
  int v26;
  IRMiloLslPredictionDO *miloLslPrediction;
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
  IRNearbyDeviceContainerDO *nearbyDeviceContainerDO;
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
  v12 = self->_contextChangeReason != 0;
  objc_msgSend(v5, "contextChangeReason");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v12 == v14)
    goto LABEL_20;
  contextChangeReason = self->_contextChangeReason;
  if (contextChangeReason)
  {
    objc_msgSend(v5, "contextChangeReason");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[NSString isEqual:](contextChangeReason, "isEqual:", v16);

    if (!v17)
      goto LABEL_20;
  }
  v18 = self->_candidatesContainer != 0;
  objc_msgSend(v5, "candidatesContainer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 == 0;

  if (v18 == v20)
    goto LABEL_20;
  candidatesContainer = self->_candidatesContainer;
  if (candidatesContainer)
  {
    objc_msgSend(v5, "candidatesContainer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[IRCandidatesContainerDO isEqual:](candidatesContainer, "isEqual:", v22);

    if (!v23)
      goto LABEL_20;
  }
  v24 = self->_miloLslPrediction != 0;
  objc_msgSend(v5, "miloLslPrediction");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25 == 0;

  if (v24 == v26)
    goto LABEL_20;
  miloLslPrediction = self->_miloLslPrediction;
  if (miloLslPrediction)
  {
    objc_msgSend(v5, "miloLslPrediction");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[IRMiloLslPredictionDO isEqual:](miloLslPrediction, "isEqual:", v28);

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
  v36 = self->_nearbyDeviceContainerDO != 0;
  objc_msgSend(v5, "nearbyDeviceContainerDO");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37 == 0;

  if (v36 == v38)
  {
LABEL_20:
    v41 = 0;
  }
  else
  {
    nearbyDeviceContainerDO = self->_nearbyDeviceContainerDO;
    if (nearbyDeviceContainerDO)
    {
      objc_msgSend(v5, "nearbyDeviceContainerDO");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = -[IRNearbyDeviceContainerDO isEqual:](nearbyDeviceContainerDO, "isEqual:", v40);

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
  IRReplayEventDO *v4;
  IRReplayEventDO *v5;
  BOOL v6;

  v4 = (IRReplayEventDO *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[IRReplayEventDO isEqualToReplayEventDO:](self, "isEqualToReplayEventDO:", v5);

  return v6;
}

+ (id)replayEventDOWithDate:(id)a3 contextChangeReason:(id)a4 candidatesContainer:(id)a5 miloLslPrediction:(id)a6 systemState:(id)a7 nearbyDeviceContainerDO:(id)a8
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
  v20 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDate:contextChangeReason:candidatesContainer:miloLslPrediction:systemState:nearbyDeviceContainerDO:", v19, v18, v17, v16, v15, v14);

  return v20;
}

- (id)copyWithReplacementDate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDate:contextChangeReason:candidatesContainer:miloLslPrediction:systemState:nearbyDeviceContainerDO:", v4, self->_contextChangeReason, self->_candidatesContainer, self->_miloLslPrediction, self->_systemState, self->_nearbyDeviceContainerDO);

  return v5;
}

- (id)copyWithReplacementContextChangeReason:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDate:contextChangeReason:candidatesContainer:miloLslPrediction:systemState:nearbyDeviceContainerDO:", self->_date, v4, self->_candidatesContainer, self->_miloLslPrediction, self->_systemState, self->_nearbyDeviceContainerDO);

  return v5;
}

- (id)copyWithReplacementCandidatesContainer:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDate:contextChangeReason:candidatesContainer:miloLslPrediction:systemState:nearbyDeviceContainerDO:", self->_date, self->_contextChangeReason, v4, self->_miloLslPrediction, self->_systemState, self->_nearbyDeviceContainerDO);

  return v5;
}

- (id)copyWithReplacementMiloLslPrediction:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDate:contextChangeReason:candidatesContainer:miloLslPrediction:systemState:nearbyDeviceContainerDO:", self->_date, self->_contextChangeReason, self->_candidatesContainer, v4, self->_systemState, self->_nearbyDeviceContainerDO);

  return v5;
}

- (id)copyWithReplacementSystemState:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDate:contextChangeReason:candidatesContainer:miloLslPrediction:systemState:nearbyDeviceContainerDO:", self->_date, self->_contextChangeReason, self->_candidatesContainer, self->_miloLslPrediction, v4, self->_nearbyDeviceContainerDO);

  return v5;
}

- (id)copyWithReplacementNearbyDeviceContainerDO:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDate:contextChangeReason:candidatesContainer:miloLslPrediction:systemState:nearbyDeviceContainerDO:", self->_date, self->_contextChangeReason, self->_candidatesContainer, self->_miloLslPrediction, self->_systemState, v4);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IRReplayEventDO)initWithCoder:(id)a3
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
  IRReplayEventDO *v14;
  objc_class *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
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
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IRReplayEventDO key \"date\" (expected %@, decoded %@)"), v7, v9, 0);
      v30 = *MEMORY[0x24BDD0FC8];
      v31[0] = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRReplayEventDOOCNTErrorDomain"), 3, v11);
      objc_msgSend(v4, "failWithError:", v12);
LABEL_9:

LABEL_10:
      v14 = 0;
LABEL_29:

      goto LABEL_30;
    }
LABEL_6:
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contextChangeReason"));
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
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IRReplayEventDO key \"contextChangeReason\" (expected %@, decoded %@)"), v9, v10, 0);
        v28 = *MEMORY[0x24BDD0FC8];
        v29 = v11;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRReplayEventDOOCNTErrorDomain"), 3, v12);
        objc_msgSend(v4, "failWithError:", v17);

        goto LABEL_9;
      }
    }
    else
    {
      objc_msgSend(v4, "error");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
        goto LABEL_10;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("candidatesContainer"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19 || (objc_msgSend(v4, "error"), v23 = (void *)objc_claimAutoreleasedReturnValue(), v23, !v23))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("miloLslPrediction"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20
        || (objc_msgSend(v4, "error"), v24 = (void *)objc_claimAutoreleasedReturnValue(), v24, !v24))
      {
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("systemState"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21
          || (objc_msgSend(v4, "error"), v25 = (void *)objc_claimAutoreleasedReturnValue(), v25, !v25))
        {
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nearbyDeviceContainerDO"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22
            || (objc_msgSend(v4, "error"), v26 = (void *)objc_claimAutoreleasedReturnValue(), v26, !v26))
          {
            self = -[IRReplayEventDO initWithDate:contextChangeReason:candidatesContainer:miloLslPrediction:systemState:nearbyDeviceContainerDO:](self, "initWithDate:contextChangeReason:candidatesContainer:miloLslPrediction:systemState:nearbyDeviceContainerDO:", v5, v7, v19, v20, v21, v22);
            v14 = self;
          }
          else
          {
            v14 = 0;
          }

        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

    goto LABEL_29;
  }
  objc_msgSend(v4, "error");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    goto LABEL_6;
  v14 = 0;
LABEL_30:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSDate *date;
  NSString *contextChangeReason;
  IRCandidatesContainerDO *candidatesContainer;
  IRMiloLslPredictionDO *miloLslPrediction;
  IRSystemStateDO *systemState;
  IRNearbyDeviceContainerDO *nearbyDeviceContainerDO;
  id v11;

  v4 = a3;
  date = self->_date;
  v11 = v4;
  if (date)
  {
    objc_msgSend(v4, "encodeObject:forKey:", date, CFSTR("date"));
    v4 = v11;
  }
  contextChangeReason = self->_contextChangeReason;
  if (contextChangeReason)
  {
    objc_msgSend(v11, "encodeObject:forKey:", contextChangeReason, CFSTR("contextChangeReason"));
    v4 = v11;
  }
  candidatesContainer = self->_candidatesContainer;
  if (candidatesContainer)
  {
    objc_msgSend(v11, "encodeObject:forKey:", candidatesContainer, CFSTR("candidatesContainer"));
    v4 = v11;
  }
  miloLslPrediction = self->_miloLslPrediction;
  if (miloLslPrediction)
  {
    objc_msgSend(v11, "encodeObject:forKey:", miloLslPrediction, CFSTR("miloLslPrediction"));
    v4 = v11;
  }
  systemState = self->_systemState;
  if (systemState)
  {
    objc_msgSend(v11, "encodeObject:forKey:", systemState, CFSTR("systemState"));
    v4 = v11;
  }
  nearbyDeviceContainerDO = self->_nearbyDeviceContainerDO;
  if (nearbyDeviceContainerDO)
  {
    objc_msgSend(v11, "encodeObject:forKey:", nearbyDeviceContainerDO, CFSTR("nearbyDeviceContainerDO"));
    v4 = v11;
  }

}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("<IRReplayEventDO | date:%@ contextChangeReason:%@ candidatesContainer:%@ miloLslPrediction:%@ systemState:%@ nearbyDeviceContainerDO:%@>"), self->_date, self->_contextChangeReason, self->_candidatesContainer, self->_miloLslPrediction, self->_systemState, self->_nearbyDeviceContainerDO);
}

@end
