@implementation ICASRankingStrategyType

- (ICASRankingStrategyType)initWithRankingStrategyType:(int64_t)a3
{
  ICASRankingStrategyType *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASRankingStrategyType;
  result = -[ICASRankingStrategyType init](&v5, sel_init);
  if (result)
    result->_rankingStrategyType = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;

  v3 = -[ICASRankingStrategyType rankingStrategyType](self, "rankingStrategyType", a3);
  if ((unint64_t)(v3 - 1) > 2)
    return CFSTR("unknown");
  else
    return off_1E771BE00[v3 - 1];
}

- (int64_t)rankingStrategyType
{
  return self->_rankingStrategyType;
}

@end
