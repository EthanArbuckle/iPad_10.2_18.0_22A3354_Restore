@implementation FCFeedTransformationClamp

+ (id)transformationWithDateRange:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  +[FCFeedRange feedRangeFromDateRange:](FCFeedRange, "feedRangeFromDateRange:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setFeedRange:", v5);
  return v4;
}

+ (id)transformationWithFeedRange:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setFeedRange:", v3);

  return v4;
}

- (id)transformFeedItems:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__FCFeedTransformationClamp_transformFeedItems___block_invoke;
  v4[3] = &unk_1E463B468;
  v4[4] = self;
  objc_msgSend(a3, "fc_arrayOfObjectsPassingTest:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __48__FCFeedTransformationClamp_transformFeedItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  if (objc_msgSend(v3, "order"))
  {
    objc_msgSend(*(id *)(a1 + 32), "feedRange");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsOrder:", objc_msgSend(v3, "order"));

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (FCFeedRange)feedRange
{
  return self->_feedRange;
}

- (void)setFeedRange:(id)a3
{
  objc_storeStrong((id *)&self->_feedRange, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedRange, 0);
}

@end
