@implementation SGPatternMetrics

- (SGPatternMetrics)init
{
  SGPatternMetrics *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SGPatternMetrics;
  v2 = -[SGPatternMetrics init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[SGPatternMetrics setSelfIdPatternMatched:](v2, "setSelfIdPatternMatched:", v3);

  }
  return v2;
}

- (SGMSelfIdPatternMatched)selfIdPatternMatched
{
  return self->_selfIdPatternMatched;
}

- (void)setSelfIdPatternMatched:(id)a3
{
  objc_storeStrong((id *)&self->_selfIdPatternMatched, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selfIdPatternMatched, 0);
}

+ (id)instance
{
  if (instance_onceToken_202 != -1)
    dispatch_once(&instance_onceToken_202, &__block_literal_global_203);
  return (id)instance__instance_201;
}

+ (void)recordSelfIdMatchWithPatternType:(SGMSIPatternType_)a3 patternHash:(id)a4 nameTokenCount:(unint64_t)a5 nameClassification:(SGMSINameClassification_)a6 messageIndex:(unint64_t)a7
{
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v12 = a4;
  objc_msgSend(a1, "instance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "selfIdPatternMatched");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "trackEventWithScalar:patternType:patternHash:nameTokens:nameClass:messageIndex:", 1, a3.var0, v12, a5, a6.var0, a7);

  v20 = (id)objc_opt_new();
  objc_msgSend(v20, "setPatternType:", a3.var0);
  objc_msgSend(v20, "setPatternHash:", v12);

  objc_msgSend(v20, "setNameTokens:", a5);
  objc_msgSend(v20, "setNameClass:", a6.var0);
  objc_msgSend(v20, "setMessageIndex:", a7);
  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "trackScalarForMessage:", v20);

  v16 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v20, "key");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.Proactive.CoreSuggestions"), v17);

  objc_msgSend(v20, "dictionaryRepresentation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

void __28__SGPatternMetrics_instance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)instance__instance_201;
  instance__instance_201 = v0;

}

@end
