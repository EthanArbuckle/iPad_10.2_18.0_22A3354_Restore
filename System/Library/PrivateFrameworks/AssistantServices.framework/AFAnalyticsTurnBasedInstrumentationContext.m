@implementation AFAnalyticsTurnBasedInstrumentationContext

- (AFAnalyticsTurnBasedInstrumentationContext)init
{
  void *v3;
  AFAnalyticsTurnBasedInstrumentationContext *v4;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AFAnalyticsTurnBasedInstrumentationContext initWithTurnIdentifier:](self, "initWithTurnIdentifier:", v3);

  return v4;
}

- (AFAnalyticsTurnBasedInstrumentationContext)initWithTurnIdentifier:(id)a3
{
  id v5;
  AFAnalyticsTurnBasedInstrumentationContext *v6;
  AFAnalyticsTurnBasedInstrumentationContext *v7;
  SISchemaClientTurnContext *v8;
  SISchemaClientTurnContext *turnContext;
  SISchemaClientTurnContext *v10;
  void *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AFAnalyticsTurnBasedInstrumentationContext;
  v6 = -[AFAnalyticsTurnBasedInstrumentationContext init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_turnIdentifier, a3);
    v8 = objc_alloc_init(SISchemaClientTurnContext);
    turnContext = v7->_turnContext;
    v7->_turnContext = v8;

    v10 = v7->_turnContext;
    AFTurnIdentifierGetBytes(v7->_turnIdentifier);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SISchemaClientTurnContext setTurnID:](v10, "setTurnID:", v11);

  }
  return v7;
}

- (NSUUID)turnIdentifier
{
  return self->_turnIdentifier;
}

- (void)emitInstrumentation:(id)a3 machAbsoluteTime:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logInstrumentation:machAbsoluteTime:turnContext:", v6, a4, self->_turnContext);

}

- (void)emitInstrumentation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logInstrumentation:turnContext:", v4, self->_turnContext);

}

- (id)nextTurnBasedContext
{
  return +[AFAnalyticsTurnBasedInstrumentationContext newTurnBasedContextWithPreviousTurnID:](AFAnalyticsTurnBasedInstrumentationContext, "newTurnBasedContextWithPreviousTurnID:", self->_turnIdentifier);
}

- (id)nextTurnBasedContextForAnalytics:(id)a3
{
  return +[AFAnalyticsTurnBasedInstrumentationContext newTurnBasedContextWithPreviousTurnID:analytics:](AFAnalyticsTurnBasedInstrumentationContext, "newTurnBasedContextWithPreviousTurnID:analytics:", self->_turnIdentifier, a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_turnIdentifier, CFSTR("turnIdentifier"));
}

- (AFAnalyticsTurnBasedInstrumentationContext)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  AFAnalyticsTurnBasedInstrumentationContext *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("turnIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[AFAnalyticsTurnBasedInstrumentationContext initWithTurnIdentifier:](self, "initWithTurnIdentifier:", v5);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_turnContext, 0);
  objc_storeStrong((id *)&self->_turnIdentifier, 0);
}

+ (id)newTurnBasedContextWithPreviousTurnID:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[AFAnalyticsTurnBasedInstrumentationContext newTurnBasedContextWithPreviousTurnID:analytics:](AFAnalyticsTurnBasedInstrumentationContext, "newTurnBasedContextWithPreviousTurnID:analytics:", v3, v4);

  return v5;
}

+ (id)newTurnBasedContextWithPreviousTurnID:(id)a3 analytics:(id)a4
{
  id v5;
  id v6;
  AFAnalyticsTurnBasedInstrumentationContext *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  if (!v6)
  {
    +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = objc_alloc_init(AFAnalyticsTurnBasedInstrumentationContext);
  v8 = objc_alloc_init(MEMORY[0x1E0D9A420]);
  if (v5)
  {
    AFTurnIdentifierGetBytes(v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v8, "setPreviousTurnID:", v9);
  -[AFAnalyticsTurnBasedInstrumentationContext emitInstrumentation:](v7, "emitInstrumentation:", v8);
  v10 = objc_opt_class();
  -[AFAnalyticsTurnBasedInstrumentationContext turnIdentifier](v7, "turnIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logInstrumentationOfType:turnIdentifier:", v10, v11);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
