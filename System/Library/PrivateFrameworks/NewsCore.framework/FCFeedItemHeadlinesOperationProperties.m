@implementation FCFeedItemHeadlinesOperationProperties

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FCFeedItemHeadlinesOperationProperties;
  -[FCFeedItemHeadlinesOperationProperties dealloc](&v3, sel_dealloc);
}

- (FCMapTable)resultHeadlinesByFeedItem
{
  return self->_resultHeadlinesByFeedItem;
}

- (void)setResultHeadlinesByFeedItem:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (FCMapTable)feedItemScoreProfiles
{
  return self->_feedItemScoreProfiles;
}

- (void)setFeedItemScoreProfiles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

@end
