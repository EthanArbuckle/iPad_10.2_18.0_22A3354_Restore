@implementation SGMailIntelligenceUnsubscriptionRule

- (SGMailIntelligenceUnsubscriptionRule)initWithUnsubscriptionRuleField:(int64_t)a3 value:(id)a4 mailCount:(id)a5 score:(id)a6
{
  id v12;
  id v13;
  id v14;
  SGMailIntelligenceUnsubscriptionRule *v15;
  SGMailIntelligenceUnsubscriptionRule *v16;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGMailIntelligenceUnsubscriptionRule.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mailCount != nil"));

    if (v14)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGMailIntelligenceUnsubscriptionRule.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("value != nil"));

  if (!v13)
    goto LABEL_8;
LABEL_3:
  if (v14)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGMailIntelligenceUnsubscriptionRule.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("score != nil"));

LABEL_4:
  v21.receiver = self;
  v21.super_class = (Class)SGMailIntelligenceUnsubscriptionRule;
  v15 = -[SGMailIntelligenceUnsubscriptionRule init](&v21, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_unsubscriptionRuleField = a3;
    objc_storeStrong((id *)&v15->_value, a4);
    objc_storeStrong((id *)&v16->_mailCount, a5);
    objc_storeStrong((id *)&v16->_score, a6);
  }

  return v16;
}

- (SGMailIntelligenceUnsubscriptionRule)initWithUnsubscriptionRuleField:(int64_t)a3 tokenCounts:(id)a4
{
  id v7;
  SGMailIntelligenceUnsubscriptionRule *v8;
  SGMailIntelligenceUnsubscriptionRule *v9;
  uint64_t v10;
  NSString *value;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSNumber *mailCount;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  NSNumber *score;
  void *v27;
  objc_super v28;

  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGMailIntelligenceUnsubscriptionRule.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tokenCounts != nil"));

  }
  v28.receiver = self;
  v28.super_class = (Class)SGMailIntelligenceUnsubscriptionRule;
  v8 = -[SGMailIntelligenceUnsubscriptionRule init](&v28, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_unsubscriptionRuleField = a3;
    objc_msgSend(v7, "token");
    v10 = objc_claimAutoreleasedReturnValue();
    value = v9->_value;
    v9->_value = (NSString *)v10;

    objc_msgSend(v7, "salientCount");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "unsignedIntegerValue");
    objc_msgSend(v7, "regularCount");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "unsignedIntegerValue") + v13;

    v16 = (void *)0x1E0CB3000;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
    v17 = objc_claimAutoreleasedReturnValue();
    mailCount = v9->_mailCount;
    v9->_mailCount = (NSNumber *)v17;

    v19 = (void *)MEMORY[0x1E0CB37E8];
    if (v15)
    {
      objc_msgSend(v7, "regularCount");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "doubleValue");
      v21 = v20;
      -[NSNumber doubleValue](v9->_mailCount, "doubleValue");
      v23 = v21 / v22;
    }
    else
    {
      v23 = 0.0;
    }
    objc_msgSend(v19, "numberWithDouble:", v23);
    v24 = objc_claimAutoreleasedReturnValue();
    score = v9->_score;
    v9->_score = (NSNumber *)v24;

    if (v15)
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  int64_t unsubscriptionRuleField;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  unsubscriptionRuleField = self->_unsubscriptionRuleField;
  v7 = a3;
  objc_msgSend(v4, "numberWithInteger:", unsubscriptionRuleField);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("unsubscriptionRuleField"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_value, CFSTR("value"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_mailCount, CFSTR("mailCount"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_score, CFSTR("score"));

}

- (SGMailIntelligenceUnsubscriptionRule)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  SGMailIntelligenceUnsubscriptionRule *v21;
  void *v22;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  sgMailIntelligenceLogHandle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("unsubscriptionRuleField"), v4, 1, CFSTR("SGErrorDomain"), 11, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D81610];
  v10 = objc_opt_class();
  sgMailIntelligenceLogHandle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v10, CFSTR("value"), v4, 1, CFSTR("SGErrorDomain"), 11, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D81610];
  v14 = objc_opt_class();
  sgMailIntelligenceLogHandle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v14, CFSTR("mailCount"), v4, 1, CFSTR("SGErrorDomain"), 11, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0D81610];
  v18 = objc_opt_class();
  sgMailIntelligenceLogHandle();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v18, CFSTR("score"), v4, 1, CFSTR("SGErrorDomain"), 11, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  if (v8 && v12 && v16 && v20)
  {
    objc_msgSend(v4, "error");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
      v21 = 0;
    else
      v21 = -[SGMailIntelligenceUnsubscriptionRule initWithUnsubscriptionRuleField:value:mailCount:score:]([SGMailIntelligenceUnsubscriptionRule alloc], "initWithUnsubscriptionRuleField:value:mailCount:score:", objc_msgSend(v8, "integerValue"), v12, v16, v20);
  }

  return v21;
}

- (id)description
{
  id v3;
  float v4;
  double v5;
  NSNumber *mailCount;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NSNumber floatValue](self->_score, "floatValue");
  v5 = (float)(v4 * 100.0);
  mailCount = self->_mailCount;
  +[SGMailIntelligenceUnsubscriptionRule prettyNameForUnsubscriptionRuleField:](SGMailIntelligenceUnsubscriptionRule, "prettyNameForUnsubscriptionRuleField:", self->_unsubscriptionRuleField);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<SGMailIntelligenceUnsubscriptionRule: %.1f%% of the %@ mails from %@ \"%@\" were ignorable>"), *(_QWORD *)&v5, mailCount, v7, self->_value);

  return v8;
}

- (int64_t)unsubscriptionRuleField
{
  return self->_unsubscriptionRuleField;
}

- (NSString)value
{
  return self->_value;
}

- (NSNumber)mailCount
{
  return self->_mailCount;
}

- (NSNumber)score
{
  return self->_score;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_mailCount, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)prettyNameForUnsubscriptionRuleField:(int64_t)a3
{
  if (a3)
    return CFSTR("sender's domain");
  else
    return CFSTR("sender");
}

@end
