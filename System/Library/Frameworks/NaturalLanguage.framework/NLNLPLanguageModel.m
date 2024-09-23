@implementation NLNLPLanguageModel

- (NLNLPLanguageModel)initWithLocalization:(id)a3 options:(id)a4
{
  id v6;
  uint64_t v7;
  NLNLPLanguageModel *v8;
  objc_super v10;

  v6 = a3;
  v7 = granularityForOptions(a4);
  v10.receiver = self;
  v10.super_class = (Class)NLNLPLanguageModel;
  v8 = -[NLLanguageModel initWithLocalization:](&v10, sel_initWithLocalization_, v6);

  if (v8)
    v8->_granularity = v7;
  return v8;
}

- (int64_t)granularity
{
  return self->_granularity;
}

- (BOOL)generatesPredictions
{
  return 1;
}

- (id)sessionWithOptions:(id)a3
{
  id v4;
  NLNLPLanguageModelSession *v5;

  v4 = a3;
  v5 = -[NLNLPLanguageModelSession initWithLanguageModel:options:]([NLNLPLanguageModelSession alloc], "initWithLanguageModel:options:", self, v4);

  return v5;
}

- (double)conditionalProbabilityForEntry:(id)a3 context:(id)a4
{
  if (conditionalProbabilityForEntry_context__onceToken != -1)
    dispatch_once(&conditionalProbabilityForEntry_context__onceToken, &__block_literal_global_3);
  return -30.0;
}

void __61__NLNLPLanguageModel_conditionalProbabilityForEntry_context___block_invoke()
{
  NSLog(CFSTR("-[conditionalProbabilityForEntry:context:] is not valid for this language model"));
}

- (double)conditionalProbabilityForWord:(id)a3 context:(id)a4
{
  if (conditionalProbabilityForWord_context__onceToken != -1)
    dispatch_once(&conditionalProbabilityForWord_context__onceToken, &__block_literal_global_241);
  return -30.0;
}

void __60__NLNLPLanguageModel_conditionalProbabilityForWord_context___block_invoke()
{
  NSLog(CFSTR("-[conditionalProbabilityForWord:context:] is not valid for this language model"));
}

- (void)enumeratePredictionsForContext:(id)a3 maxEntriesPerPrediction:(unint64_t)a4 usingBlock:(id)a5
{
  if (enumeratePredictionsForContext_maxEntriesPerPrediction_usingBlock__onceToken != -1)
    dispatch_once(&enumeratePredictionsForContext_maxEntriesPerPrediction_usingBlock__onceToken, &__block_literal_global_244);
}

void __88__NLNLPLanguageModel_enumeratePredictionsForContext_maxEntriesPerPrediction_usingBlock___block_invoke()
{
  NSLog(CFSTR("-[enumeratePredictionsForContext:maxEntriesPerPrediction:usingBlock:] is not valid for this language model"));
}

- (void)enumeratePredictionsForContext:(id)a3 maxWordsPerPrediction:(unint64_t)a4 usingBlock:(id)a5
{
  if (enumeratePredictionsForContext_maxWordsPerPrediction_usingBlock__onceToken != -1)
    dispatch_once(&enumeratePredictionsForContext_maxWordsPerPrediction_usingBlock__onceToken, &__block_literal_global_247);
}

void __86__NLNLPLanguageModel_enumeratePredictionsForContext_maxWordsPerPrediction_usingBlock___block_invoke()
{
  NSLog(CFSTR("-[enumeratePredictionsForContext:maxWordsPerPrediction:usingBlock:] is not valid for this language model"));
}

@end
