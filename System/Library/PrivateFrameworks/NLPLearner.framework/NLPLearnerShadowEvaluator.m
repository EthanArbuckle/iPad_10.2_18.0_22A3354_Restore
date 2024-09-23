@implementation NLPLearnerShadowEvaluator

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.NLPLearner", "NLPLearnerShadowEvaluator");
    v3 = (void *)sLog_5;
    sLog_5 = (uint64_t)v2;

  }
}

+ (id)evaluatorWithLocale:(id)a3 andTask:(int64_t)a4
{
  id v5;
  __objc2_class **v6;
  void *v7;

  v5 = a3;
  if ((unint64_t)(a4 - 5) > 2)
    v6 = off_24EDB8B30;
  else
    v6 = off_24EDB93C8[a4 - 5];
  v7 = (void *)objc_msgSend(objc_alloc(*v6), "initWithLocale:andTask:", v5, a4);

  return v7;
}

- (NLPLearnerShadowEvaluator)initWithLocale:(id)a3 andTask:(int64_t)a4
{
  id v6;
  NLPLearnerShadowEvaluator *v7;
  uint64_t v8;
  NSLocale *locale;
  uint64_t v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NLPLearnerShadowEvaluator;
  v7 = -[NLPLearnerShadowEvaluator init](&v12, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    locale = v7->_locale;
    v7->_locale = (NSLocale *)v8;

    v7->_evaluationTask = a4;
    v10 = 3;
    if ((unint64_t)(a4 - 4) >= 3)
      v10 = 1;
    v7->_topK = v10;
  }

  return v7;
}

- (id)prepareDataFromRecords:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = -[NLPLearnerShadowEvaluator evaluationTask](self, "evaluationTask");
  -[NLPLearnerShadowEvaluator locale](self, "locale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[NLPLearnerTextData dataForTask:andLocale:](NLPLearnerTextData, "dataForTask:andLocale:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "loadFromCoreDuet:limitSamplesTo:", v4, -[NLPLearnerShadowEvaluator maxSamples](self, "maxSamples"));
  return v7;
}

- (id)evaluateModel:(id)a3 onRecords:(id)a4 options:(id)a5 completion:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void *)MEMORY[0x24BDBCE88];
  v16 = *MEMORY[0x24BDBCAB0];
  v17 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "exceptionWithName:reason:userInfo:", v16, v19, 0);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v20);
}

- (unint64_t)topK
{
  return self->_topK;
}

- (unint64_t)maxSamples
{
  return self->_maxSamples;
}

- (void)setMaxSamples:(unint64_t)a3
{
  self->_maxSamples = a3;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (int64_t)evaluationTask
{
  return self->_evaluationTask;
}

- (void)setEvaluationTask:(int64_t)a3
{
  self->_evaluationTask = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
