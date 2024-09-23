@implementation SGMailIntelligenceSaliency

- (SGMailIntelligenceSaliency)initWithMessageId:(id)a3 mailboxId:(id)a4 score:(id)a5 isSalient:(BOOL)a6 gteSaliency:(int64_t)a7 isCounted:(BOOL)a8 creationDate:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  SGMailIntelligenceSaliency *v18;
  SGMailIntelligenceSaliency *v19;
  void *v21;
  void *v22;
  objc_super v26;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a9;
  if (v16)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGMailIntelligenceSaliency.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("score != nil"));

    if (v14)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGMailIntelligenceSaliency.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("messageId != nil"));

LABEL_3:
  v26.receiver = self;
  v26.super_class = (Class)SGMailIntelligenceSaliency;
  v18 = -[SGMailIntelligenceSaliency init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_messageId, a3);
    objc_storeStrong((id *)&v19->_mailboxId, a4);
    objc_storeStrong((id *)&v19->_score, a5);
    v19->_isSalient = a6;
    v19->_gteSaliency = a7;
    v19->_isCounted = a8;
    objc_storeStrong((id *)&v19->_creationDate, a9);
  }

  return v19;
}

- (SGMailIntelligenceSaliency)initWithMessageId:(id)a3 mailboxId:(id)a4 score:(id)a5 isSalient:(BOOL)a6 creationDate:(id)a7
{
  return -[SGMailIntelligenceSaliency initWithMessageId:mailboxId:score:isSalient:gteSaliency:isCounted:creationDate:](self, "initWithMessageId:mailboxId:score:isSalient:gteSaliency:isCounted:creationDate:", a3, a4, a5, a6, 2, 0, a7);
}

- (void)encodeWithCoder:(id)a3
{
  NSString *messageId;
  id v5;

  messageId = self->_messageId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", messageId, CFSTR("messageId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mailboxId, CFSTR("mailboxId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_score, CFSTR("score"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isSalient, CFSTR("isSalient"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_creationDate, CFSTR("creationDate"));

}

- (SGMailIntelligenceSaliency)initWithCoder:(id)a3
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
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  SGMailIntelligenceSaliency *v22;
  void *v23;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  sgMailIntelligenceLogHandle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("messageId"), v4, 1, CFSTR("SGErrorDomain"), 11, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D81610];
  v10 = objc_opt_class();
  sgMailIntelligenceLogHandle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v10, CFSTR("mailboxId"), v4, 1, CFSTR("SGErrorDomain"), 11, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D81610];
  v14 = objc_opt_class();
  sgMailIntelligenceLogHandle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v14, CFSTR("score"), v4, 1, CFSTR("SGErrorDomain"), 11, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSalient"));
  v18 = (void *)MEMORY[0x1E0D81610];
  v19 = objc_opt_class();
  sgMailIntelligenceLogHandle();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v19, CFSTR("creationDate"), v4, 1, CFSTR("SGErrorDomain"), 11, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0;
  if (v16 && v12 && v8 && v21)
  {
    objc_msgSend(v4, "error");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
      v22 = 0;
    else
      v22 = -[SGMailIntelligenceSaliency initWithMessageId:mailboxId:score:isSalient:creationDate:]([SGMailIntelligenceSaliency alloc], "initWithMessageId:mailboxId:score:isSalient:creationDate:", v8, v12, v16, v17, v21);
  }

  return v22;
}

- (id)description
{
  id v3;
  const __CFString *v4;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = CFSTR("salient");
  if (!self->_isSalient)
    v4 = CFSTR("regular");
  return (id)objc_msgSend(v3, "initWithFormat:", CFSTR("<SGMailIntelligenceSaliency score: %@ (%@), messageId: %@, mailboxId: %@>"), self->_score, v4, self->_messageId, self->_mailboxId);
}

- (NSNumber)decayedScore
{
  return (NSNumber *)+[SGMailIntelligenceSaliency decayScore:creationTime:](SGMailIntelligenceSaliency, "decayScore:creationTime:", self->_score, self->_creationDate);
}

- (NSNumber)score
{
  return self->_score;
}

- (NSString)messageId
{
  return self->_messageId;
}

- (NSString)mailboxId
{
  return self->_mailboxId;
}

- (BOOL)isSalient
{
  return self->_isSalient;
}

- (int64_t)gteSaliency
{
  return self->_gteSaliency;
}

- (void)setGteSaliency:(int64_t)a3
{
  self->_gteSaliency = a3;
}

- (BOOL)isCounted
{
  return self->_isCounted;
}

- (void)setIsCounted:(BOOL)a3
{
  self->_isCounted = a3;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_mailboxId, 0);
  objc_storeStrong((id *)&self->_messageId, 0);
  objc_storeStrong((id *)&self->_score, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)decayScore:(id)a3 creationTime:(id)a4
{
  id v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;

  v5 = a3;
  objc_msgSend(a4, "timeIntervalSinceNow");
  v7 = exp(v6 * -0.693147181 / -259200.0);
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "doubleValue");
  v10 = v9;

  return (id)objc_msgSend(v8, "numberWithDouble:", v10 * v7);
}

@end
