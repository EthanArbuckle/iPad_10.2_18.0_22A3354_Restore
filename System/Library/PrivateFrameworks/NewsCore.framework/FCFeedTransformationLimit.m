@implementation FCFeedTransformationLimit

+ (id)transformationWithLimit:(unint64_t)a3
{
  void *v4;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setLimit:", a3);
  return v4;
}

- (id)transformFeedItems:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(v4, "fc_subarrayWithMaxCount:", -[FCFeedTransformationLimit limit](self, "limit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

@end
