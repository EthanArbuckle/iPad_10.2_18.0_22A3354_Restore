@implementation _CDInteractionPolicy

+ (id)policyWithRateLimiter:(id)a3 lifespanInSeconds:(unint64_t)a4 maxNumberStored:(unint64_t)a5 timeResolutionInSeconds:(unint64_t)a6 maxNumberOfRecipients:(unint64_t)a7 maxNumberOfKeywords:(unint64_t)a8 maxNumberOfAttachments:(unint64_t)a9
{
  id v15;
  void *v16;

  v15 = a3;
  v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRateLimiter:lifespanInSeconds:maxNumberStored:timeResolutionInSeconds:maxNumberOfRecipients:maxNumberOfKeywords:maxNumberOfAttachments:", v15, a4, a5, a6, a7, a8, a9);

  return v16;
}

- (_CDInteractionPolicy)initWithRateLimiter:(id)a3 lifespanInSeconds:(unint64_t)a4 maxNumberStored:(unint64_t)a5 timeResolutionInSeconds:(unint64_t)a6 maxNumberOfRecipients:(unint64_t)a7 maxNumberOfKeywords:(unint64_t)a8 maxNumberOfAttachments:(unint64_t)a9
{
  id v16;
  _CDInteractionPolicy *v17;
  _CDInteractionPolicy *v18;
  objc_super v20;

  v16 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_CDInteractionPolicy;
  v17 = -[_CDInteractionPolicy init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_rateLimiter, a3);
    v18->_lifespanInSeconds = a4;
    v18->_maxNumberStored = a5;
    v18->_timeResolutionInSeconds = a6;
    v18->_maxNumberOfRecipients = a7;
    v18->_maxNumberOfKeywords = a8;
    v18->_maxNumberOfAttachments = a9;
  }

  return v18;
}

- (id)description
{
  id v3;
  objc_class *v4;
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
  void *v16;
  void *v17;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@ { \n"), v5);

  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[_CDInteractionPolicy rateLimiter](self, "rateLimiter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("     rateLimitCount: %@\n"), v8);

  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[_CDInteractionPolicy rateLimiter](self, "rateLimiter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "period");
  objc_msgSend(v9, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("    rateLimitPeriod: %@\n"), v11);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_CDInteractionPolicy lifespanInSeconds](self, "lifespanInSeconds"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("           lifespan: %@\n"), v12);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_CDInteractionPolicy maxNumberStored](self, "maxNumberStored"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("    maxNumberStored: %@\n"), v13);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_CDInteractionPolicy timeResolutionInSeconds](self, "timeResolutionInSeconds"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("     timeResolution: %@s\n"), v14);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_CDInteractionPolicy maxNumberOfRecipients](self, "maxNumberOfRecipients"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("      maxRecipients: %@\n"), v15);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_CDInteractionPolicy maxNumberOfKeywords](self, "maxNumberOfKeywords"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("        maxKeywords: %@\n"), v16);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_CDInteractionPolicy maxNumberOfAttachments](self, "maxNumberOfAttachments"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("     maxAttachments: %@\n"), v17);

  objc_msgSend(v3, "appendString:", CFSTR("}\n"));
  return v3;
}

+ (id)policyFromDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _CDRateLimiter *v25;
  void *v26;
  void *v27;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RateLimitCount"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RateLimitPeriodInSecounds"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LifespanInSeconds"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MaxNumberStored"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TimeResolutionInSeconds"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MaxNumberOfRecipients"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MaxNumberOfKeywords"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MaxNumberOfAttachments"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = 0;
    if (v5 && v6 && v27 && v7 && v8 && v9 && v10 && v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (objc_opt_isKindOfClass() & 1) != 0
        && (objc_opt_isKindOfClass() & 1) != 0
        && (objc_opt_isKindOfClass() & 1) != 0
        && (objc_opt_isKindOfClass() & 1) != 0
        && (objc_opt_isKindOfClass() & 1) != 0
        && (objc_opt_isKindOfClass() & 1) != 0
        && (objc_opt_isKindOfClass() & 1) != 0)
      {
        v25 = [_CDRateLimiter alloc];
        v14 = objc_msgSend(v5, "unsignedIntegerValue");
        objc_msgSend(v6, "doubleValue");
        v15 = -[_CDRateLimiter initWithCount:perPeriod:](v25, "initWithCount:perPeriod:", v14);
        if (v15)
        {
          v26 = (void *)v15;
          v24 = objc_msgSend(v27, "unsignedIntegerValue");
          v23 = objc_msgSend(v7, "unsignedIntegerValue");
          v22 = objc_msgSend(v8, "unsignedIntegerValue");
          v21 = objc_msgSend(v9, "unsignedIntegerValue");
          v16 = objc_msgSend(v10, "unsignedIntegerValue");
          v20 = objc_msgSend(v12, "unsignedIntegerValue");
          v17 = a1;
          v18 = v26;
          objc_msgSend(v17, "policyWithRateLimiter:lifespanInSeconds:maxNumberStored:timeResolutionInSeconds:maxNumberOfRecipients:maxNumberOfKeywords:maxNumberOfAttachments:", v26, v24, v23, v22, v21, v16, v20);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v13 = 0;
          v18 = 0;
        }

      }
      else
      {
        v13 = 0;
      }
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (unint64_t)defaultLifespan
{
  return 14515200;
}

+ (unint64_t)defaultTimeResolutionInSeconds
{
  return 0;
}

+ (unint64_t)defaultMaxNumberStored
{
  return 10000;
}

+ (unint64_t)defaultMaxNumberOfRecipients
{
  return 20;
}

+ (unint64_t)defaultMaxNumberOfKeywords
{
  return 20;
}

+ (unint64_t)defaultMaxNumberOfAttachments
{
  return 20;
}

+ (id)defaultPolicy
{
  _CDRateLimiter *v3;
  void *v4;

  v3 = -[_CDRateLimiter initWithCount:perPeriod:]([_CDRateLimiter alloc], "initWithCount:perPeriod:", 500, 60.0);
  objc_msgSend(a1, "policyWithRateLimiter:lifespanInSeconds:maxNumberStored:timeResolutionInSeconds:maxNumberOfRecipients:maxNumberOfKeywords:maxNumberOfAttachments:", v3, objc_msgSend(a1, "defaultLifespan"), objc_msgSend(a1, "defaultMaxNumberStored"), objc_msgSend(a1, "defaultTimeResolutionInSeconds"), objc_msgSend(a1, "defaultMaxNumberOfRecipients"), objc_msgSend(a1, "defaultMaxNumberOfKeywords"), objc_msgSend(a1, "defaultMaxNumberOfAttachments"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)defaultPolicyForEmail
{
  void *v2;
  _CDRateLimiter *v3;

  objc_msgSend(a1, "defaultPolicy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[_CDRateLimiter initWithCount:perPeriod:]([_CDRateLimiter alloc], "initWithCount:perPeriod:", 5000, 60.0);
  objc_msgSend(v2, "setRateLimiter:", v3);

  objc_msgSend(v2, "setTimeResolutionInSeconds:", 3600);
  objc_msgSend(v2, "setMaxNumberOfKeywords:", 0);
  return v2;
}

+ (id)defaultPolicyForMeetings
{
  void *v2;
  _CDRateLimiter *v3;

  objc_msgSend(a1, "defaultPolicy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[_CDRateLimiter initWithCount:perPeriod:]([_CDRateLimiter alloc], "initWithCount:perPeriod:", 1000, 60.0);
  objc_msgSend(v2, "setRateLimiter:", v3);

  return v2;
}

+ (id)defaultPolicyForMessages
{
  void *v2;
  _CDRateLimiter *v3;

  objc_msgSend(a1, "defaultPolicy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[_CDRateLimiter initWithCount:perPeriod:]([_CDRateLimiter alloc], "initWithCount:perPeriod:", 2000, 60.0);
  objc_msgSend(v2, "setRateLimiter:", v3);

  objc_msgSend(v2, "setMaxNumberOfKeywords:", 0);
  return v2;
}

+ (id)defaultPolicyForCalls
{
  void *v2;

  objc_msgSend(a1, "defaultPolicy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMaxNumberOfKeywords:", 0);
  return v2;
}

+ (id)specialPolicyForFirstPartyApps
{
  void *v2;
  _CDRateLimiter *v3;

  objc_msgSend(a1, "defaultPolicy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[_CDRateLimiter initWithCount:perPeriod:]([_CDRateLimiter alloc], "initWithCount:perPeriod:", 2000, 60.0);
  objc_msgSend(v2, "setRateLimiter:", v3);

  objc_msgSend(v2, "setLifespanInSeconds:", 14515200);
  objc_msgSend(v2, "setMaxNumberStored:", 50000);
  return v2;
}

- (_CDRateLimiter)rateLimiter
{
  return (_CDRateLimiter *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRateLimiter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (unint64_t)lifespanInSeconds
{
  return self->_lifespanInSeconds;
}

- (void)setLifespanInSeconds:(unint64_t)a3
{
  self->_lifespanInSeconds = a3;
}

- (unint64_t)maxNumberStored
{
  return self->_maxNumberStored;
}

- (void)setMaxNumberStored:(unint64_t)a3
{
  self->_maxNumberStored = a3;
}

- (unint64_t)timeResolutionInSeconds
{
  return self->_timeResolutionInSeconds;
}

- (void)setTimeResolutionInSeconds:(unint64_t)a3
{
  self->_timeResolutionInSeconds = a3;
}

- (unint64_t)maxNumberOfRecipients
{
  return self->_maxNumberOfRecipients;
}

- (void)setMaxNumberOfRecipients:(unint64_t)a3
{
  self->_maxNumberOfRecipients = a3;
}

- (unint64_t)maxNumberOfKeywords
{
  return self->_maxNumberOfKeywords;
}

- (void)setMaxNumberOfKeywords:(unint64_t)a3
{
  self->_maxNumberOfKeywords = a3;
}

- (unint64_t)maxNumberOfAttachments
{
  return self->_maxNumberOfAttachments;
}

- (void)setMaxNumberOfAttachments:(unint64_t)a3
{
  self->_maxNumberOfAttachments = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rateLimiter, 0);
}

@end
