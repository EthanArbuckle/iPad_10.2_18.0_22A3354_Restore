@implementation NLLMLanguageModel

- (BOOL)generatesPredictions
{
  return 1;
}

- (id)sessionWithOptions:(id)a3
{
  id v4;
  NLLMLanguageModelSession *v5;

  v4 = a3;
  v5 = -[NLLMLanguageModelSession initWithLanguageModel:options:]([NLLMLanguageModelSession alloc], "initWithLanguageModel:options:", self, v4);

  return v5;
}

- (id)tokenIDConverter
{
  NLLMTokenIDConverter *tokenIDConverter;
  NLLMTokenIDConverter *v4;
  NLLMTokenIDConverter *v5;

  tokenIDConverter = self->_tokenIDConverter;
  if (!tokenIDConverter)
  {
    v4 = -[NLLMTokenIDConverter initWithLanguageModel:]([NLLMTokenIDConverter alloc], "initWithLanguageModel:", self);
    v5 = self->_tokenIDConverter;
    self->_tokenIDConverter = v4;

    tokenIDConverter = self->_tokenIDConverter;
  }
  return tokenIDConverter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenIDConverter, 0);
}

@end
