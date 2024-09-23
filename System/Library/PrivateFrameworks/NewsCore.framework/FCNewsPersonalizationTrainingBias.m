@implementation FCNewsPersonalizationTrainingBias

- (FCNewsPersonalizationTrainingBias)initWithDictionary:(id)a3
{
  id v4;
  FCNewsPersonalizationTrainingBias *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  double v12;
  FCNewsPersonalizationTrainingBias *v13;
  void *v15;
  void *v16;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FCNewsPersonalizationTrainingBias;
  v5 = -[FCNewsPersonalizationTrainingBias init](&v17, sel_init);
  if (!v5)
    goto LABEL_15;
  FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("eventType"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("feedType"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("groupType"), 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v6 || v7 || v8)
  {
    FCAppConfigurationNumberValue(v4, (uint64_t)CFSTR("bias"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_storeStrong((id *)&v5->_eventType, v6);
      objc_storeStrong((id *)&v5->_feedType, v7);
      objc_storeStrong((id *)&v5->_groupType, v9);
      objc_msgSend(v11, "doubleValue");
      v10 = 0;
      v5->_bias = v12;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Was supplied a group bias with no bias"));
        *(_DWORD *)buf = 136315906;
        v19 = "-[FCNewsPersonalizationTrainingBias initWithDictionary:]";
        v20 = 2080;
        v21 = "FCNewsPersonalizationTrainingBias.m";
        v22 = 1024;
        v23 = 44;
        v24 = 2114;
        v25 = v16;
        _os_log_fault_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: InvalidGroupBias) : %s %s:%d %{public}@", buf, 0x26u);

      }
      v5 = 0;
      v10 = 1;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Was supplied a group bias with no event, feed or group type"));
      *(_DWORD *)buf = 136315906;
      v19 = "-[FCNewsPersonalizationTrainingBias initWithDictionary:]";
      v20 = 2080;
      v21 = "FCNewsPersonalizationTrainingBias.m";
      v22 = 1024;
      v23 = 37;
      v24 = 2114;
      v25 = v15;
      _os_log_fault_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: InvalidGroupBias) : %s %s:%d %{public}@", buf, 0x26u);

    }
    v10 = 1;
    v11 = v5;
    v5 = 0;
  }

  if (v10)
  {
    v13 = 0;
  }
  else
  {
LABEL_15:
    v5 = v5;
    v13 = v5;
  }

  return v13;
}

- (NSString)identifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[FCNewsPersonalizationTrainingBias eventType](self, "eventType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCNewsPersonalizationTrainingBias feedType](self, "feedType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCNewsPersonalizationTrainingBias groupType](self, "groupType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCNewsPersonalizationTrainingBias identifierForEventType:feedType:groupType:](FCNewsPersonalizationTrainingBias, "identifierForEventType:feedType:groupType:", v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (id)identifierForEventType:(id)a3 feedType:(id)a4 groupType:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v7, "stringByAppendingString:", CFSTR("-"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendString:", v11);

  }
  if (v8)
  {
    objc_msgSend(v8, "stringByAppendingString:", CFSTR("-"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendString:", v12);

  }
  if (v9)
  {
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("-"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendString:", v13);

  }
  if (objc_msgSend(v10, "length"))
    objc_msgSend(v10, "deleteCharactersInRange:", objc_msgSend(v10, "length") - 1, 1);

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCNewsPersonalizationTrainingBias eventType](self, "eventType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; eventType: %@"), v4);

  -[FCNewsPersonalizationTrainingBias feedType](self, "feedType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; feedType: %@"), v5);

  -[FCNewsPersonalizationTrainingBias groupType](self, "groupType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; groupType: %@"), v6);

  -[FCNewsPersonalizationTrainingBias bias](self, "bias");
  objc_msgSend(v3, "appendFormat:", CFSTR("; bias: %f"), v7);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (double)bias
{
  return self->_bias;
}

- (void)setBias:(double)a3
{
  self->_bias = a3;
}

- (NSString)eventType
{
  return self->_eventType;
}

- (void)setEventType:(id)a3
{
  objc_storeStrong((id *)&self->_eventType, a3);
}

- (NSString)feedType
{
  return self->_feedType;
}

- (void)setFeedType:(id)a3
{
  objc_storeStrong((id *)&self->_feedType, a3);
}

- (NSString)groupType
{
  return self->_groupType;
}

- (void)setGroupType:(id)a3
{
  objc_storeStrong((id *)&self->_groupType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupType, 0);
  objc_storeStrong((id *)&self->_feedType, 0);
  objc_storeStrong((id *)&self->_eventType, 0);
}

@end
