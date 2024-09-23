@implementation ATXPredictionUserContext

- (ATXPredictionUserContext)initWithProto:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  ATXPredictionUserContext *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  if (!v4)
  {
LABEL_8:
    v9 = 0;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_default();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[ATXPredictionUserContext initWithProto:].cold.1((uint64_t)self, v8);

    goto LABEL_8;
  }
  v5 = v4;
  if (objc_msgSend(v5, "hasLastUnlockDate"))
  {
    v6 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(v5, "lastUnlockDate");
    v7 = (void *)objc_msgSend(v6, "initWithTimeIntervalSince1970:");
  }
  else
  {
    v7 = 0;
  }
  if (objc_msgSend(v5, "hasLastAppLaunchDate"))
  {
    v10 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(v5, "lastAppLaunchDate");
    v11 = (void *)objc_msgSend(v10, "initWithTimeIntervalSince1970:");
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v5, "lastAppLaunch");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "secondMostRecentAppLaunch");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastAppActionLaunch");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[ATXPredictionUserContext initWithLastUnlockDate:lastAppLaunch:lastAppLaunchDate:secondMostRecentAppLaunch:lastAppActionLaunch:](self, "initWithLastUnlockDate:lastAppLaunch:lastAppLaunchDate:secondMostRecentAppLaunch:lastAppActionLaunch:", v7, v12, v11, v13, v14);

  v9 = self;
LABEL_14:

  return v9;
}

- (ATXPredictionUserContext)initWithLastUnlockDate:(id)a3 lastAppLaunch:(id)a4 lastAppLaunchDate:(id)a5 secondMostRecentAppLaunch:(id)a6 lastAppActionLaunch:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  ATXPredictionUserContext *v17;
  double v18;
  double v19;
  uint64_t v20;
  NSString *lastAppLaunch;
  double v22;
  uint64_t v23;
  NSString *secondMostRecentAppLaunch;
  uint64_t v25;
  NSString *lastAppActionLaunch;
  objc_super v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v28.receiver = self;
  v28.super_class = (Class)ATXPredictionUserContext;
  v17 = -[ATXPredictionUserContext init](&v28, sel_init);
  if (v17)
  {
    v18 = 0.0;
    v19 = 0.0;
    if (v12)
      objc_msgSend(v12, "timeIntervalSince1970", 0.0);
    v17->_absoluteLastUnlockDate = v19;
    v20 = objc_msgSend(v13, "copy");
    lastAppLaunch = v17->_lastAppLaunch;
    v17->_lastAppLaunch = (NSString *)v20;

    if (v14)
    {
      objc_msgSend(v14, "timeIntervalSince1970");
      v18 = v22;
    }
    v17->_absoluteLastAppLaunchDate = v18;
    v23 = objc_msgSend(v15, "copy");
    secondMostRecentAppLaunch = v17->_secondMostRecentAppLaunch;
    v17->_secondMostRecentAppLaunch = (NSString *)v23;

    v25 = objc_msgSend(v16, "copy");
    lastAppActionLaunch = v17->_lastAppActionLaunch;
    v17->_lastAppActionLaunch = (NSString *)v25;

  }
  return v17;
}

- (id)proto
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  v4 = v3;
  if (self->_absoluteLastUnlockDate != 0.0)
    objc_msgSend(v3, "setLastUnlockDate:");
  objc_msgSend(v4, "setLastAppLaunch:", self->_lastAppLaunch);
  if (self->_absoluteLastAppLaunchDate != 0.0)
    objc_msgSend(v4, "setLastAppLaunchDate:");
  objc_msgSend(v4, "setSecondMostRecentAppLaunch:", self->_secondMostRecentAppLaunch);
  objc_msgSend(v4, "setLastAppActionLaunch:", self->_lastAppActionLaunch);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAppActionLaunch, 0);
  objc_storeStrong((id *)&self->_secondMostRecentAppLaunch, 0);
  objc_storeStrong((id *)&self->_lastAppLaunch, 0);
}

- (NSDate)lastUnlockDate
{
  void *v2;

  if (self->_absoluteLastUnlockDate == 0.0)
    v2 = 0;
  else
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", self->_absoluteLastUnlockDate);
  return (NSDate *)v2;
}

- (NSDate)lastAppLaunchDate
{
  void *v2;

  if (self->_absoluteLastAppLaunchDate == 0.0)
    v2 = 0;
  else
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", self->_absoluteLastAppLaunchDate);
  return (NSDate *)v2;
}

- (id)description
{
  void *v2;
  void *v3;

  -[ATXPredictionUserContext jsonDict](self, "jsonDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)jsonDict
{
  void *v2;
  void *v3;
  void *v5;
  __CFString *v6;
  const __CFString *lastAppLaunch;
  void *v8;
  __CFString *v9;
  const __CFString *secondMostRecentAppLaunch;
  NSString *lastAppActionLaunch;
  const __CFString *v12;
  void *v13;
  _QWORD v15[5];
  _QWORD v16[6];

  v16[5] = *MEMORY[0x1E0C80C00];
  v15[0] = CFSTR("lastUnlockDate");
  -[ATXPredictionUserContext lastUnlockDate](self, "lastUnlockDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[ATXPredictionUserContext lastUnlockDate](self, "lastUnlockDate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "description");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("nil");
  }
  lastAppLaunch = (const __CFString *)self->_lastAppLaunch;
  if (!lastAppLaunch)
    lastAppLaunch = CFSTR("nil");
  v16[0] = v6;
  v16[1] = lastAppLaunch;
  v15[1] = CFSTR("lastAppLaunch");
  v15[2] = CFSTR("lastAppLaunchDate");
  -[ATXPredictionUserContext lastAppLaunchDate](self, "lastAppLaunchDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[ATXPredictionUserContext lastAppLaunchDate](self, "lastAppLaunchDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "description");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = CFSTR("nil");
  }
  secondMostRecentAppLaunch = (const __CFString *)self->_secondMostRecentAppLaunch;
  if (!secondMostRecentAppLaunch)
    secondMostRecentAppLaunch = CFSTR("nil");
  v16[2] = v9;
  v16[3] = secondMostRecentAppLaunch;
  lastAppActionLaunch = self->_lastAppActionLaunch;
  v15[3] = CFSTR("secondMostRecentAppLaunch");
  v15[4] = CFSTR("lastAppActionLaunch");
  if (lastAppActionLaunch)
    v12 = (const __CFString *)lastAppActionLaunch;
  else
    v12 = CFSTR("nil");
  v16[4] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

  }
  if (v5)
  {

  }
  return v13;
}

- (ATXPredictionUserContext)initWithProtoData:(id)a3
{
  id v4;
  ATXPBPredictionUserContext *v5;
  ATXPredictionUserContext *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBPredictionUserContext initWithData:]([ATXPBPredictionUserContext alloc], "initWithData:", v4);

    self = -[ATXPredictionUserContext initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXPredictionUserContext proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  ATXPredictionUserContext *v4;
  ATXPredictionUserContext *v5;
  BOOL v6;

  v4 = (ATXPredictionUserContext *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXPredictionUserContext isEqualToATXPredictionUserContext:](self, "isEqualToATXPredictionUserContext:", v5);

  return v6;
}

- (BOOL)isEqualToATXPredictionUserContext:(id)a3
{
  id *v4;
  id *v5;
  NSString *lastAppLaunch;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  char v11;
  NSString *secondMostRecentAppLaunch;
  NSString *v14;
  NSString *v15;
  NSString *v16;
  char v17;
  NSString *v18;
  NSString *v19;

  v4 = (id *)a3;
  v5 = v4;
  if (self->_absoluteLastUnlockDate != *((double *)v4 + 1))
    goto LABEL_7;
  lastAppLaunch = self->_lastAppLaunch;
  v7 = (NSString *)v4[3];
  if (lastAppLaunch == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = lastAppLaunch;
    v10 = -[NSString isEqual:](v9, "isEqual:", v8);

    if ((v10 & 1) == 0)
      goto LABEL_7;
  }
  if (self->_absoluteLastAppLaunchDate != *((double *)v5 + 2))
  {
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  secondMostRecentAppLaunch = self->_secondMostRecentAppLaunch;
  v14 = (NSString *)v5[4];
  if (secondMostRecentAppLaunch == v14)
  {

  }
  else
  {
    v15 = v14;
    v16 = secondMostRecentAppLaunch;
    v17 = -[NSString isEqual:](v16, "isEqual:", v15);

    if ((v17 & 1) == 0)
      goto LABEL_7;
  }
  v18 = self->_lastAppActionLaunch;
  v19 = v18;
  if (v18 == v5[5])
    v11 = 1;
  else
    v11 = -[NSString isEqual:](v18, "isEqual:");

LABEL_8:
  return v11;
}

- (NSString)lastAppLaunch
{
  return self->_lastAppLaunch;
}

- (NSString)secondMostRecentAppLaunch
{
  return self->_secondMostRecentAppLaunch;
}

- (NSString)lastAppActionLaunch
{
  return self->_lastAppActionLaunch;
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_fault_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-ATXPBPredictionUserContext proto", (uint8_t *)&v5, 0xCu);

}

@end
