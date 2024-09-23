@implementation FCFeedRequest

- (void)setMaxCount:(unint64_t)a3
{
  self->_maxCount = a3;
}

- (void)setFeedRange:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setFeedID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (FCFeedRange)feedRange
{
  return self->_feedRange;
}

- (NSString)feedID
{
  return self->_feedID;
}

- (id)copyWithZone:(_NSZone *)a3
{
  FCFeedRequest *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init(FCFeedRequest);
  -[FCFeedRequest feedID](self, "feedID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCFeedRequest setFeedID:](v4, "setFeedID:", v5);

  -[FCFeedRequest feedRange](self, "feedRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCFeedRequest setFeedRange:](v4, "setFeedRange:", v6);

  -[FCFeedRequest setMaxCount:](v4, "setMaxCount:", -[FCFeedRequest maxCount](self, "maxCount"));
  -[FCFeedRequest setIsExpendable:](v4, "setIsExpendable:", -[FCFeedRequest isExpendable](self, "isExpendable"));
  -[FCFeedRequest setCachedOnly:](v4, "setCachedOnly:", -[FCFeedRequest cachedOnly](self, "cachedOnly"));
  -[FCFeedRequest requiredFeature](self, "requiredFeature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCFeedRequest setRequiredFeature:](v4, "setRequiredFeature:", v7);

  return v4;
}

- (unint64_t)maxCount
{
  return self->_maxCount;
}

- (BOOL)isExpendable
{
  return self->_isExpendable;
}

- (void)setIsExpendable:(BOOL)a3
{
  self->_isExpendable = a3;
}

- (BOOL)cachedOnly
{
  return self->_cachedOnly;
}

- (void)setCachedOnly:(BOOL)a3
{
  self->_cachedOnly = a3;
}

- (FCFeedItemFeature)requiredFeature
{
  return self->_requiredFeature;
}

- (void)setRequiredFeature:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredFeature, 0);
  objc_storeStrong((id *)&self->_feedRange, 0);
  objc_storeStrong((id *)&self->_feedID, 0);
}

@end
