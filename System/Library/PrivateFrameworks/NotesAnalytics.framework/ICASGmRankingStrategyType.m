@implementation ICASGmRankingStrategyType

- (ICASGmRankingStrategyType)initWithGmRankingStrategyType:(int64_t)a3
{
  ICASGmRankingStrategyType *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASGmRankingStrategyType;
  result = -[ICASGmRankingStrategyType init](&v5, sel_init);
  if (result)
    result->_gmRankingStrategyType = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;

  v3 = -[ICASGmRankingStrategyType gmRankingStrategyType](self, "gmRankingStrategyType", a3);
  if ((unint64_t)(v3 - 1) > 2)
    return CFSTR("unknown");
  else
    return off_1E771CEE8[v3 - 1];
}

- (int64_t)gmRankingStrategyType
{
  return self->_gmRankingStrategyType;
}

@end
