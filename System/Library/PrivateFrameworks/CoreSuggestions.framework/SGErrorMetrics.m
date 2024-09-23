@implementation SGErrorMetrics

- (SGErrorMetrics)init
{
  SGErrorMetrics *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SGErrorMetrics;
  v2 = -[SGErrorMetrics init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[SGErrorMetrics setBadInteractionIgnored:](v2, "setBadInteractionIgnored:", v3);

  }
  return v2;
}

- (SGMBadInteractionIgnored)badInteractionIgnored
{
  return self->_badInteractionIgnored;
}

- (void)setBadInteractionIgnored:(id)a3
{
  objc_storeStrong((id *)&self->_badInteractionIgnored, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badInteractionIgnored, 0);
}

+ (id)instance
{
  if (instance_onceToken_219 != -1)
    dispatch_once(&instance_onceToken_219, &__block_literal_global_220);
  return (id)instance__instance_218;
}

+ (void)recordInteractionIgnoredWithReason:(SGMInteractionIgnoredReason_)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(a1, "instance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "badInteractionIgnored");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trackEventWithScalar:reason:", 1, a3.var0);

  v11 = (id)objc_opt_new();
  objc_msgSend(v11, "setReason:", a3.var0);
  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trackScalarForMessage:", v11);

  v7 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v11, "key");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.Proactive.CoreSuggestions"), v8);

  objc_msgSend(v11, "dictionaryRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

void __26__SGErrorMetrics_instance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)instance__instance_218;
  instance__instance_218 = v0;

}

@end
